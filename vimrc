" Specify plugin install directory
call plug#begin('~/.vim/plugged')

" Misc plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'

" Navigation plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'pechorin/any-jump.vim'

" Language support plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'lervag/vimtex'

" Appearance Plugins
Plug 'gruvbox-community/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" Normal mode: Jump to definition under cursore
nnoremap <leader>j :AnyJump<CR>

" Automatically format on save
au BufWrite * :Autoformat

" Set colorscheme
colorscheme gruvbox

" Create a command to open config
silent! command Editrc e $MYVIMRC
silent! command Runrc so $MYVIMRC

" set latex flavor
let g:tex_flavor = 'latex'

" Use ESC to enter normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" Don't show line numbers in the terminal
if has("nvim")
    au TermOpen * setlocal nonumber norelativenumber
endif

" Use ; for entering command mode
nmap ; :

"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50

" Use spacebar as leader key
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Add nerdtree toggle keybinding
nmap <leader>nt :NERDTreeToggle<cr>
let g:NERDTreeWinSize=40

" use syntax highlighting
filetype plugin indent on
syntax on

" active relative line numbering
set relativenumber
set rnu

" Conqueror of completion keybindings
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" FZF keybindings
nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>
nmap <leader>c :Commands<CR>

" Use a floating window instead of lower frame
let g:fzf_layout = {'window': { 'width': 0.8, 'height': 0.8 } }

" Use mouse scrolling
set mouse=a

" Allow for spellchecking but not cap checking
set spelllang=en
set spellcapcheck=""

" Don't wrap text
set nowrap

" Use jj as esc in insert mode
imap jj <Esc>

" turn on line numbering
set number

" set searches to be case insensitive
set ignorecase

" Set tabs to be 4 spaces by default
set expandtab
set tabstop=4
set shiftwidth=4

" Set textwidth to 100 characters
set textwidth=80
set colorcolumn=81

" Always show a status bar
set laststatus=2

" Add a highlight line for the cursor
set cursorline

" update every 100 ms
set updatetime=100

" Remember location in files
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Detect file types
if has("autocmd")
    filetype plugin indent on
endif

let g:airline#extensions#tabline#enabled = 1

