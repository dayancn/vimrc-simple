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
" vim related
"-----------------------------------------------------------------------
nmap <Leader>h :help <c-r>=expand("<cword>")<cr><cr>

" open or close mouse mode
nmap <leader>ma :set mouse=a<CR>
nmap <leader>mc :set mouse&<CR>


"-----------------------------------------------------------------------
" file related
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

"move text but keep selected
vnoremap > ><CR>gv
vnoremap < <<CR>gv


"-----------------------------------------------------------------------
" plugin related
"-----------------------------------------------------------------------
" use <space> to toggle taglist window
nmap <silent> <space> :Tlist<CR>


"-----------------------------------------------------------------------
" useful mappings for file buffers
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
" useful mappings for tab page
"-----------------------------------------------------------------------
nmap <leader>tc :tabnew %<cr>
nmap <leader>td :tabclose<cr>
nmap <leader>th :tab help<cr>

" opens a new tab with the current buffer's path
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" switch CWD to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>


"-----------------------------------------------------------------------
" tags related mappings
"-----------------------------------------------------------------------
nmap <leader>ts :ts <C-R>=expand("<cword>")<cr><cr>
nmap <leader>tt :ts<cr>
nmap <leader>tp :tp<cr>
nmap <leader>tf :tp<cr>
nmap <leader>tn :tn<cr>


"-----------------------------------------------------------------------
" quickfix mappings
"-----------------------------------------------------------------------
nmap <silent> <leader>cw :cw<cr>
nmap <silent> <leader>cc :call QuickFix()<cr>
nmap <silent> <leader>cp ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
nmap <silent> <leader>cf :call PrevFile()<CR>
nmap <silent> <leader>cn :call NextFile()<CR>


"-----------------------------------------------------------------------
" spelling checking
"-----------------------------------------------------------------------
" set default spelling language
setlocal spelllang=en nospell
nmap <leader>ss :setlocal spell!<cr>
nmap <leader>sn ]s
nmap <leader>sp [s
nmap <leader>sa zg
nmap <leader>s? z=


"-----------------------------------------------------------------------
" vimgrep searching
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
" MRU
"-----------------------------------------------------------------------
nmap <leader>f :MRU<CR>


"-----------------------------------------------------------------------
" CTRL-P
"-----------------------------------------------------------------------
map <c-b> :CtrlPBuffer<cr>


"-----------------------------------------------------------------------
" bufExplorer
"-----------------------------------------------------------------------
nmap <leader>o :BufExplorer<cr>


"-----------------------------------------------------------------------
" nerdtree mappings
"-----------------------------------------------------------------------
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


"-----------------------------------------------------------------------
" other mappings
"-----------------------------------------------------------------------
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

" remap VIM 0 to first non-blank character
nmap 0 ^

" forces (re)indentation of a block of code
" nmap <F1> - reserved for vim help
" nmap <F2> - reserved for used by vim plugin visualmark.vim
nmap <F3> /<C-R>=expand("<cword>")<CR><CR>
nmap <F4> ?<C-R>=expand("<cword>")<CR><CR>
" nmap <F5> - reserved for vim lookupfile plugin
" nmap <F6> - reserved for vimgrep
nmap <F7> :call RunShell("Generating > ", "~/.vim/shell/lookfile.sh " . g:LookupFile_TagExpr)<cr>
nmap <F8> vi"*n
nmap <F9> vi"#N
" nmap <F10> - reserved for guake
" nmap <F11> - reserved for vim full screen
" nmap <F12> - reserved for vim plugin visualmark.vim

" compile switch
nmap <leader>ca :!CC a<CR>
nmap <leader>cb :!CC b<CR>
nmap <leader>ck :!CC k<CR>


" add debug hotkeys for c programming
nmap <silent> <leader>` o#error "======>>>>>>)))))) PROGRAM CONTAINS THIS PATH !!!"<ESC>0
nmap <silent> <leader>1 Ofshow(YELLOW "---------------\n");<ESC>0
nmap <silent> <leader>2 Ofshow(YELLOW "---------------\n");<ESC>0
nmap <silent> <leader>3 yiwofshow(GREEN "-----[%d]-----\n", <ESC>pa);<ESC>0
nmap <silent> <leader>4 yiwOfshow(GREEN "-----[%d]-----\n", <ESC>pa);<ESC>0
nmap <silent> <leader>5 yiwo#pragma message(PRINT_MACRO(<ESC>pa))<ESC>0
nmap <silent> <leader>6 yiwO#pragma message(PRINT_MACRO(<ESC>pa))<ESC>0
nmap <silent> <leader>7 ofshow("%8p\n", __builtin_return_address(0));<ESC>0
nmap <silent> <leader>8 oDBG_ENTERF;<ESC>0
nmap <silent> <leader>9 oDBG_RETURN();<left><left>
nmap <silent> <leader>0 oDBG_PRINTF;<ESC>0

" add debug hotkeys for Makefile
nmap <silent> <leader>m1 yiwo$(warning "==> [$(<ESC>pa)] <==")<ESC>0
nmap <silent> <leader>m2 yiwo$(error   "==> [$(<ESC>pa)] <==")<ESC>0
