""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: write customized mapping here for unity.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set for <Leader>
let mapleader = ","
let g:mapleader = ","

" set for <LocalLeader>
let maplocalleader='\'
let g:maplocalleader='\'

" The time in milliseconds that is waited for a key code or mapped key sequence to complete.
set timeoutlen=500

"-----------------------------------------------------------------------
" 1. vim related
"-----------------------------------------------------------------------
nmap <Leader>h :help <c-r>=expand("<cword>")<cr><cr>


"-----------------------------------------------------------------------
" 2. file related
"-----------------------------------------------------------------------
" save with overwrite easily
nmap <silent> <Leader>w :w!<cr>

" stop highlight, auto turned back on when using a search command
nmap <silent> <leader><cr> :nohlsearch<cr>


"-----------------------------------------------------------------------
" 2. plugin related
"-----------------------------------------------------------------------
" use <space> to toggle taglist window
nmap <silent> <space> :Tlist<CR>
