vim.lsp.config('pyright', {
	cmd = {
		"pyright-langserver",
		"--stdio",
	},
	filetypes = { "python", "py" },
})

vim.lsp.enable('pyright')
