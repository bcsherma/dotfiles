"""""""""""""""""""""""""""""""""""""
" _   __ (_)____ ___   _____ _____  "
" | | / // // __ `__ \ / ___// ___/ "
" | |/ // // / / / / // /   / /__   "
" |___//_//_/ /_/ /_//_/    \___/   "
"                                   "
"""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Misc plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'jiangmiao/auto-pairs'

" Navigation plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'pechorin/any-jump.vim'

" Language support plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-test/vim-test'
Plug 'Chiel92/vim-autoformat'
Plug 'lervag/vimtex'

" Appearance Plugins
Plug 'gruvbox-community/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Basic settings
set nowrap
set number
set rnu
set ignorecase
set textwidth=80
set colorcolumn=81
set relativenumber
set cursorline
set updatetime=10
colorscheme gruvbox

" Airline config
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty='⚡'

" Keybindings
nmap ; :
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>
nmap <leader>c :Commands<CR>
nmap <leader>e :NERDTreeToggle<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>j :AnyJump<CR>

" Misc settings
let g:tex_flavor = 'latex'
let g:fzf_layout = {'window': { 'width': 0.8, 'height': 0.8 } }
let test#strategy = "dispatch"
au BufWrite * :Autoformat
