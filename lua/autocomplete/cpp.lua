-- Configuração de autocompletar para C++ com clangd e nvim-cmp

-- Inicializa LSP com clangd
require('lspconfig').clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp" },
  cmd = { "clangd" },
}
