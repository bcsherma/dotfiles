"""""""""""""""""""""""""""""""""""""
" | | / // // __ `__ \ / ___// ___/ "
" | |/ // // / / / / // /   / /__   "
" |___//_//_/ /_/ /_//_/    \___/   "
"                                   "
"""""""""""""""""""""""""""""""""""""

" If in nvim, need to get plugged into the run time path
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
endif
call plug#begin('~/.vim/plugged')
" Misc plugins
Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'voldikss/vim-floaterm'
" Navigation plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
" Language support plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-test/vim-test'
Plug 'lervag/vimtex'
" Appearance Plugins
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/gruvbox-material'
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
set scrolloff=999
set updatetime=10
set background=dark
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
tnoremap <Esc> <C-\><C-n>
colorscheme gruvbox-material

" Airline config
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty=' ⚡'

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
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" FZF settings
nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>c :Commands<CR>
let g:fzf_layout = {'window': { 'width': 0.8, 'height': 0.8 } }

" Misc settings
nmap <leader>e :NERDTreeToggle<CR>
let g:tex_flavor = 'latex'
let test#strategy = "dispatch"
let g:sneak#label = 1
