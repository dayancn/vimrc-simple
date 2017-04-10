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
nmap <Leader>ma :set mouse=a<CR>
nmap <Leader>mc :set mouse&<CR>


"-----------------------------------------------------------------------
" file related
"-----------------------------------------------------------------------
" save with overwrite easily
nmap <silent> <Leader>w :w!<cr>

" stop highlight, auto turned back on when using a search command
nmap <silent> <Leader><cr> :nohlsearch<cr>

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

" YankStack
"nmap <Leader>y :Yanks<CR>
"noremap <c-p> <Plug>yankstack_substitute_older_paste
"noremap <c-n> <Plug>yankstack_substitute_newer_paste


"-----------------------------------------------------------------------
" useful mappings for file buffers
"-----------------------------------------------------------------------
" move to next file
nnoremap <LocalLeader>fn :next<cr>

" move to previous file
nnoremap <LocalLeader>ff :previous<cr>

" move to next buffer
nnoremap <LocalLeader>bn :bn<cr>

" move to previous buffer
nnoremap <LocalLeader>bf :bp<cr>

" list open buffers
nnoremap <LocalLeader>bb :ls<cr>

" close the current buffer
nnoremap <LocalLeader>bd :Bclose<cr>

" close all the buffers
nnoremap <LocalLeader>ba :1,1000 bd!<cr>


"-----------------------------------------------------------------------
" useful mappings for tab page
"-----------------------------------------------------------------------
nmap <Leader>tc :tabnew %<cr>
nmap <Leader>td :tabclose<cr>
nmap <Leader>th :tab help<cr>

" opens a new tab with the current buffer's path
nmap <Leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" switch CWD to the directory of the open buffer
nmap <Leader>cd :cd %:p:h<cr>:pwd<cr>


"-----------------------------------------------------------------------
" tags related mappings
"-----------------------------------------------------------------------
nmap <Leader>ts :ts <C-R>=expand("<cword>")<cr><cr>
nmap <Leader>tt :ts<cr>
nmap <Leader>tp :tp<cr>
nmap <Leader>tf :tp<cr>
nmap <Leader>tn :tn<cr>


"-----------------------------------------------------------------------
" quickfix mappings
"-----------------------------------------------------------------------
nmap <silent> <Leader>cw :cw<cr>
nmap <silent> <Leader>cc :call QuickFix()<cr>
nmap <silent> <Leader>cp ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
nmap <silent> <Leader>cf :call PrevFile()<CR>
nmap <silent> <Leader>cn :call NextFile()<CR>


"-----------------------------------------------------------------------
" spelling checking
"-----------------------------------------------------------------------
" set default spelling language
setlocal spelllang=en nospell
nmap <Leader>ss :setlocal spell!<cr>
nmap <Leader>sn ]s
nmap <Leader>sp [s
nmap <Leader>sa zg
nmap <Leader>s? z=


"-----------------------------------------------------------------------
" vimgrep searching
"-----------------------------------------------------------------------
nmap <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>

" Vimgreps in the current file
nmap <Leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" Open vimgrep and put the cursor in the right position
nnoremap <Leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" When you press gv you vimgrep after the selected text
vnoremap <silent> <Leader>g :call VisualSelection('gv', '')<CR>

" When you press <Leader>r you can search and replace the selected text
vnoremap <silent> <Leader>r :call VisualSelection('replace', '')<CR>


"-----------------------------------------------------------------------
" search on-line mappings
"-----------------------------------------------------------------------
" www.baidu.com
nmap <Leader>a :call OnlineDoc(1)<CR>
" www.bing.com
nmap <Leader>b :call OnlineDoc(2)<CR>
" dict.cn
nmap <Leader>c :call OnlineDoc(3)<CR>
" www.iciba.com
nmap <Leader>e :call OnlineDoc(4)<CR>


"-----------------------------------------------------------------------
" MRU
"-----------------------------------------------------------------------
nmap <Leader>f :MRU<CR>


"-----------------------------------------------------------------------
" bufExplorer
"-----------------------------------------------------------------------
nmap <Leader>o :BufExplorer<cr>


"-----------------------------------------------------------------------
" nerdtree mappings
"-----------------------------------------------------------------------
nmap <Leader>nn :NERDTreeToggle<cr>
nmap <Leader>nb :NERDTreeFromBookmark
nmap <Leader>nf :NERDTreeFind<cr>


"-----------------------------------------------------------------------
" other mappings
"-----------------------------------------------------------------------
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" toggle paste mode on and off
noremap <Leader>pp :setlocal paste!<cr>

" remap VIM 0 to first non-blank character
nmap 0 ^

" forces (re)indentation of a block of code
" nmap <F1> - reserved for vim help
" nmap <F2> - reserved for used by vim plugin visualmark.vim
nmap <F3> /<C-R>=expand("<cword>")<CR><CR>
nmap <F4> ?<C-R>=expand("<cword>")<CR><CR>
" nmap <F5> - reserved for vim lookupfile plugin
" nmap <F6> - reserved for vimgrep
nmap <F7> :call RunShell("Generating > ", "~/.vim_rain/shell/lookfile.sh " . g:LookupFile_TagExpr)<cr>
nmap <F8> vi"*n
nmap <F9> vi"#N
" nmap <F10> - reserved for guake
" nmap <F11> - reserved for vim full screen
" nmap <F12> - reserved for vim plugin visualmark.vim

" compile switch
nmap <Leader>ca :!CC a<CR>
nmap <Leader>cb :!CC b<CR>
nmap <Leader>ck :!CC k<CR>


" add debug hotkeys for c programming
nmap <silent> <Leader>` o#error "======>>>>>>)))))) PROGRAM CONTAINS THIS PATH !!!"<ESC>0
nmap <silent> <Leader>1 Ofshow(YELLOW "---------------\n");<ESC>0
nmap <silent> <Leader>2 Ofshow(YELLOW "---------------\n");<ESC>0
nmap <silent> <Leader>3 yiwofshow(GREEN "-----[%d]-----\n", <ESC>pa);<ESC>0
nmap <silent> <Leader>4 yiwOfshow(GREEN "-----[%d]-----\n", <ESC>pa);<ESC>0
nmap <silent> <Leader>5 yiwo#pragma message(PRINT_MACRO(<ESC>pa))<ESC>0
nmap <silent> <Leader>6 yiwO#pragma message(PRINT_MACRO(<ESC>pa))<ESC>0
nmap <silent> <Leader>7 ofshow("%8p\n", __builtin_return_address(0));<ESC>0
nmap <silent> <Leader>8 oDBG_ENTERF;<ESC>0
nmap <silent> <Leader>9 oDBG_RETURN();<left><left>
nmap <silent> <Leader>0 oDBG_PRINTF;<ESC>0

" add debug hotkeys for Makefile
nmap <silent> <Leader>m1 yiwo$(warning "==> [$(<ESC>pa)] <==")<ESC>0
nmap <silent> <Leader>m2 yiwo$(error   "==> [$(<ESC>pa)] <==")<ESC>0
