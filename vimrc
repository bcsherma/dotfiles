" If in nvim, need to get plugged into the run time path
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
endif
call plug#begin('~/.vim/plugged')

" Misc plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Navigation plugins
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'

" Appearance Plugins
Plug 'projekt0n/github-nvim-theme'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
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
colorscheme github_dark
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
tnoremap <Esc> <C-\><C-n>

" Misc settings
let g:sneak#label = 1

" Don't let the colorscheme overwrite the background
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
