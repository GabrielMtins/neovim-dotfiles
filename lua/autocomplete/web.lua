-- Configuração de autocompletar para HTML, CSS e JavaScript com nvim-cmp

-- Inicializa os LSPs necessários
local lspconfig = require('lspconfig')

-- HTML
lspconfig.html.setup({
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" }
})

-- CSS
lspconfig.cssls.setup({
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" }
})

-- JavaScript/TypeScript
lspconfig.ts_ls.setup({
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

