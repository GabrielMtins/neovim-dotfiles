vim.lsp.config('clangd', {
	cmd = {
		"clangd",
		"--clang-tidy=false",
	},
	filetypes = { "c", "cpp" },
})

vim.lsp.enable('clangd')
