" Run pathogen
execute pathogen#infect()

" use syntax highlighting
filetype plugin indent on
syntax on

" active relative line numbering
set relativenumber
set rnu

" enable power line fonts for airline
" let g:airline_powerline_fonts = 1

" Remove all trailing white space by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Use ; to open up a nerd tree
nnoremap ; :NERDTreeToggle<CR>
" Close tree on file open
let NERDTreeQuitOnOpen=1

" Allow for spellchecking
set spelllang=en

" Set colorscheme to be hybrid material
set background=dark
colorscheme hybrid_material

" turn on line numbering
set number

" set searches to be case insensitive
set ignorecase

" Set tabs to be 4 spaces by default
set expandtab
set tabstop=4
set shiftwidth=4

" Set textwidth to 72 characters
set textwidth=72

" Always show a status bar
set laststatus=2

" Add a highlight line for the cursor
set cursorline
set scrolloff=10

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

" airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
