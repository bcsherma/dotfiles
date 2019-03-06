" turn on line numbering
set number

" Set tabs to be 4 spaces by default
set expandtab
set tabstop=4
set shiftwidth=4

" Always show a status bar
set laststatus=2

" Add a highlight line for the cursor
set cursorline
set scrolloff=10

" Run pathogen
execute pathogen#infect()

" Remember location in files
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Detect file types
if has("autocmd")
  filetype plugin indent on
endif

