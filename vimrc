" Run pathogen
execute pathogen#infect()

" use syntax highlighting
filetype plugin on
syntax on

" active relative line numbering
set relativenumber
set rnu

" enable power line fonts for airline
" let g:airline_powerline_fonts = 1

" Remove all trailing white space by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Use control hjkl to move between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Allow for spellchecking
set spelllang=en
set spell

" Set colorscheme to be hybrid material
set background=dark
colorscheme atom

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

