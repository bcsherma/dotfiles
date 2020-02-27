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
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'altercation/vim-colors-solarized'

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
let g:NERDTreeWinSize=50

" Use material colorscheme
set background=light
colorscheme solarized

" use syntax highlighting
filetype plugin indent on
syntax on

" active relative line numbering
set relativenumber
set rnu

" Remove all trailing white space by pressing F
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

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
set spell
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

" Set textwidth to 72 characters
set textwidth=100

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


" Set airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

  " unicode symbols
let g:airline_symbols.crypt = '🔒 '
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

let g:tmuxline_separators = {
    \ 'left' : '  ',
    \ 'left_alt':  ' ',
    \ 'right' :  ' ',
    \ 'right_alt' :' ',
    \ 'space' : ' '}

" Don't use powerline symbols in tmuxline
let g:tmuxline_powerline_separators = 0

" Change folder symbols for dev icons
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsDefaultFolderOpenSymbol = ' '
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '

