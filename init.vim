set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set termguicolors

call plug#begin()
" Status bar
Plug 'feline-nvim/feline.nvim'

" Highlight para glsl
Plug 'tikhomirov/vim-glsl'

" Themes
Plug 'EdenEast/nightfox.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'scottmckendry/cyberdream.nvim'

" Árvore de navegação e ícones
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " optional

" Exibir buffers como abas
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Tab para autocompletar
Plug 'ervandew/supertab'  

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

lua require'feline'.setup()
lua require'bufferline'.setup()
colorscheme cyberdream
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

nnoremap gT :bprev<CR>
nnoremap gt :bnext<CR>
nnoremap <C-o> :bprev<CR>
nnoremap <C-p> :bnext<CR>
nnoremap <C-d> :bd<CR>
nnoremap <C-n> :NvimTreeOpen<CR>

lua require('autocomplete.cpp')

lua <<EOF
require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true, -- Fecha a árvore ao abrir um arquivo (opcional)
      window_picker = {
        enable = false, -- Desativa a seleção de janela ao abrir arquivos
      },
    },
  },
})
EOF
