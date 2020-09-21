"""""""""""""""""""""""""""""""""""""
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
Plug 'editorconfig/editorconfig-vim'

" Navigation plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'

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
" Plug 'ryanoasis/vim-devicons'

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
nmap ; :
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
au BufWrite * :Autoformat
colorscheme gruvbox

" Airline config
let g:airline#extensions#tabline#enabled = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰ '
" let g:airline_symbols.maxlinenr = '  '
" let g:airline_symbols.dirty=' ⚡'

" COC keybindings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
nmap <leader>rn <Plug>(coc-rename)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" FZF settings
nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>c :Commands<CR>
let g:fzf_layout = {'window': { 'width': 0.8, 'height': 0.8 } }

" Misc settings
nmap <leader>e :NERDTreeToggle<CR>
let g:tex_flavor = 'latex'
let test#strategy = "dispatch"
