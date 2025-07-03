-- Tipos de autocompletar
-- Dependências: clang
require('autocomplete.cpp')
require('autocomplete.web')
require('autocomplete.python')

-- Autocompletar com nvim-cmp e LuaSnip
local cmp = require'cmp'
local luasnip = require'luasnip'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local npairs = require('nvim-autopairs')

npairs.setup()

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	}),

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}),

	window = {
		completion = {
			max_height = 5,
		}
	},
})

-- Desativar warnings e erros
vim.diagnostic.config({
	virtual_text = false,   -- Remove mensagens inline
	signs = false,         -- Remove ícones na coluna
	underline = false,     -- Remove sublinhado
	update_in_insert = false
})
