" Specify plugin install directory
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

" Language support plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'Vimjas/vim-python-pep8-indent'

" Appearance plugins
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

" Initialize plugin system
call plug#end()

" Create a command to open config
command Editrc e $MYVIMRC
command Runrc so $MYVIMRC

" Use ESC to enter normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" Use ; for entering command mode
nmap ; :

" Use spacebar as leader key
let mapleader = "\<Space>"

" Add nerdtree toggle keybinding
nmap <leader>nt :NERDTreeToggle<cr>
let g:NERDTreeWinSize=40

" Use material colorscheme
set background=light
colorscheme solarized8

" use syntax highlighting
filetype plugin indent on
syntax on

" Set clipboard to synchronize with default register
set clipboard^=unnamed

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

" Coc python import sorting
command ImportSort :CocCommand python.sortImports

" FZF keybindings
nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>

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
set textwidth=100
set colorcolumn=100

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
