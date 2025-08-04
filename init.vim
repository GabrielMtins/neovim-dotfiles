" Configurações de teclas:
" Ctrl + n: abrir a árvore de navegação
" Ctrl + o ou gT: buffer anterior
" Ctrl + p ou gt: próximo buffer
" Ctrl + d: fechar o buffer atual
" F9: deletar a pasta ./build
" F10: executar o arquivo ./run_build.sh
" Há um plugin para integrar tabas e buffers, então tanto fazer os atalhos
" que for utilizar.
" É necessário utilizar alguma das nerdfonts para a utilização de ícones.

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set termguicolors
set pumheight=8
set nowrap

call plug#begin()
" Status bar
Plug 'feline-nvim/feline.nvim'

" Highlight para glsl
Plug 'tikhomirov/vim-glsl'

" Themes
Plug 'EdenEast/nightfox.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'scottmckendry/cyberdream.nvim'
Plug 'maxmx03/fluoromachine.nvim'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'Mofiqul/vscode.nvim'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }

" Árvore de navegação e ícones
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " optional

" Exibir buffers como abas
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Tab para autocompletar
Plug 'ervandew/supertab'  

" Plugins para autocompletar
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'windwp/nvim-autopairs'
call plug#end()

lua require'feline'.setup()
lua require'bufferline'.setup()

" colorscheme catppuccin-mocha
" colorscheme carbonfox
" colorscheme github_dark_default
" colorscheme tokyonight-night

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

nnoremap <C-o> :bprev<CR>
nnoremap <C-p> :bnext<CR>
nnoremap gT :bprev<CR>
nnoremap gt :bnext<CR>
nnoremap <C-d> :bd<CR>
nnoremap <C-n> :NvimTreeOpen<CR>
nnoremap <C-n> :NvimTreeOpen<CR>

" A configuração primária que eu uso é pro cmake
" tenha um arquivo run_build.sh na raiz do diretório que você
" está utilizando para que possa executar com a keybinding
nnoremap <F10> :!./run_build.sh<CR>
nnoremap <F9> :!rm -rf ./build<CR>

lua require('autocomplete.cfg')

" Configuração para o tema ter uma cor de fundo mais escura
lua require("catppuccin").setup({color_overrides = {mocha = {base = "#161621"}}})
" colorscheme github_dark_high_contrast
" colorscheme catppuccin-mocha
" colorscheme cyberdream
colorscheme carbonfox
" colorscheme moonfly

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

