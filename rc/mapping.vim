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

" open or close mouse mode
nmap <leader>ma :set mouse=a<CR>
nmap <leader>mc :set mouse&<CR>


"-----------------------------------------------------------------------
" 2. file related
"-----------------------------------------------------------------------
" save with overwrite easily
nmap <silent> <Leader>w :w!<cr>

" stop highlight, auto turned back on when using a search command
nmap <silent> <leader><cr> :nohlsearch<cr>

" make j/k treat long lines as break lines
nmap j gj
nmap k gk

" for multiple windows switching
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"-----------------------------------------------------------------------
" 3. plugin related
"-----------------------------------------------------------------------
" use <space> to toggle taglist window
nmap <silent> <space> :Tlist<CR>


"-----------------------------------------------------------------------
" 4. useful mappings for file buffers
"-----------------------------------------------------------------------
" move to next file
map <LocalLeader>fn :next<cr>

" move to previous file
map <LocalLeader>ff :previous<cr>

" move to next buffer
map <LocalLeader>bn :bn<cr>

" move to previous buffer
map <LocalLeader>bf :bp<cr>

" list open buffers
map <LocalLeader>bb :ls<cr>

" close the current buffer
map <LocalLeader>bd :Bclose<cr>

" close all the buffers
map <LocalLeader>ba :1,1000 bd!<cr>


"-----------------------------------------------------------------------
" 5. useful mappings for tab page
"-----------------------------------------------------------------------
nmap <leader>tc :tabnew %<cr>
nmap <leader>td :tabclose<cr>
nmap <leader>th :tab help<cr>

" opens a new tab with the current buffer's path
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" switch CWD to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>


"-----------------------------------------------------------------------
" 6. quickfix mappings
"-----------------------------------------------------------------------
nmap <silent> <leader>cw :cw<cr>
nmap <silent> <leader>cc :call QuickFix()<cr>
nmap <silent> <leader>cp ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
nmap <silent> <leader>cf :call PrevFile()<CR>
nmap <silent> <leader>cn :call NextFile()<CR>


"-----------------------------------------------------------------------
" 7. spelling checking
"-----------------------------------------------------------------------
" set default spelling language
setlocal spelllang=en nospell
nmap <leader>ss :setlocal spell!<cr>
nmap <leader>sn ]s
nmap <leader>sp [s
nmap <leader>sa zg
nmap <leader>s? z=


"-----------------------------------------------------------------------
" 8. vimgrep searching
"-----------------------------------------------------------------------
nmap <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>

" Vimgreps in the current file
nmap <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" Open vimgrep and put the cursor in the right position
nnoremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" When you press gv you vimgrep after the selected text
vnoremap <silent> <leader>g :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>


"-----------------------------------------------------------------------
" search on-line mappings
"-----------------------------------------------------------------------
" www.baidu.com
map <leader>a :call OnlineDoc(1)<CR>
" www.bing.com
map <leader>b :call OnlineDoc(2)<CR>
" dict.cn
map <leader>c :call OnlineDoc(3)<CR>
" www.iciba.com
map <leader>e :call OnlineDoc(4)<CR>


"-----------------------------------------------------------------------
" other mappings
"-----------------------------------------------------------------------
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" open a buffer for scribble
noremap <leader>q :e ~/.scribble<cr>

" toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

" remap VIM 0 to first non-blank character
nmap 0 ^
