:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set nu rnu

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
"Plug 'https://github.com/preservim/nerdtree' " NerdTree
"Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
"Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'sainnhe/gruvbox-material'
Plug 'https://github.com/ryanoasis/vim-devicons' " Icons for NerdTree and Airline
Plug 'nvim-tree/nvim-tree.lua' "Nvim tree for Neovim
Plug 'neovim/nvim-lspconfig'
Plug 'xbase-lab/xbase', { 'do': 'make install' }
"Plug 'https://github.com/wincent/command-t' " Command T
Plug 'https://github.com/tpope/vim-fugitive' " Git Integration
Plug 'ibhagwan/fzf-lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

set encoding=UTF-8

call plug#end()

colorscheme gruvbox-material

lua require'xbase'.setup()
lua require'nvim-tree'.setup {}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.sourcekit.setup{}
lua require'lspconfig'.tsserver.setup{}

nnoremap <C-f> :NvimTreeFocus<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>

:set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols                                                                                                                              
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
