-- Tipos de autocompletar
-- Dependências: clang
require('autocomplete.cpp')
require('autocomplete.web')
require('autocomplete.python')

-- Autocompletar com nvim-cmp e LuaSnip
local cmp = require'cmp'
local luasnip = require'luasnip'

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
vim.diagnostic.disable()
