""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: write customized mapping here for unity.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"-----------------------------------------------------------------------
" vim related
"-----------------------------------------------------------------------
nmap <silent> <Leader>h :help <c-r>=expand("<cword>")<cr><cr>

" open or close mouse mode
nmap <silent> <Leader>ma :set mouse=a<CR>
nmap <silent> <Leader>mc :set mouse&<CR>


"-----------------------------------------------------------------------
" override vim commands
"-----------------------------------------------------------------------
nmap gf gF
nmap <C-W>f <C-W>F
nmap <C-W><C-F> <C-W>F
nmap <C-W>t <C-W>gF
nmap <C-W><C-T> <C-W>gF

" remap 0 to first non-blank character
nmap 0 ^

" make j/k treat long lines as break lines
nmap j gj
nmap k gk

" for multiple windows switching
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l


"-----------------------------------------------------------------------
" file or directory related
"-----------------------------------------------------------------------
"move text but keep selected
vmap > ><CR>gv
vmap < <<CR>gv

" save with overwrite easily
nmap <silent> <Leader>w :w!<cr>

" quit the current window
nmap <silent> <Leader>q :q<cr>
nmap <silent> <Leader>Q :q!<cr>

" stop highlight, auto turned back on when using a search command
nmap <silent> <Leader><cr> :nohlsearch<cr>

" remove the windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" toggle paste mode on and off
noremap <Leader>pp :setlocal paste!<cr>

" switch CWD to the directory of the open buffer
noremap <Leader>cd :cd %:p:h<cr>:pwd<cr>


"-----------------------------------------------------------------------
" bufExplorer
"-----------------------------------------------------------------------
nmap <silent> <Leader>o :BufExplorer<cr>


"-----------------------------------------------------------------------
" tab page
"-----------------------------------------------------------------------
nmap <Leader>tc :tabnew %<cr>
nmap <Leader>td :tabclose<cr>
nmap <Leader>th :tab help<cr>

" opens a new tab with the current buffer's path
nmap <Leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


"-----------------------------------------------------------------------
" MRU
"-----------------------------------------------------------------------
nmap <silent> <Leader>f :MRU<CR>


"-----------------------------------------------------------------------
" nerdtree mappings
"-----------------------------------------------------------------------
nmap <silent> <Leader>nn :NERDTreeToggle<cr>
nmap <silent> <Leader>nf :NERDTreeFind<cr>


"-----------------------------------------------------------------------
" tagbar/taglist plugin
"-----------------------------------------------------------------------
"nmap <silent> <space> :Tlist<CR>
nmap <silent> <space> :TagbarToggle<CR>


"-----------------------------------------------------------------------
" tags related mappings
"-----------------------------------------------------------------------
nmap <Leader>tj :tj <C-R>=expand("<cword>")<cr><cr>
nmap <Leader>ts :ts <C-R>=expand("<cword>")<cr><cr>
nmap <Leader>tt :ts<cr>
nmap <Leader>tp :tp<cr>
nmap <Leader>tf :tp<cr>
nmap <Leader>tn :tn<cr>


"-----------------------------------------------------------------------
" quickfix mappings
"-----------------------------------------------------------------------
nmap <silent> <Leader>cc :call CQuickfix()<cr>
nmap <silent> <Leader>cf :call CQuickfixPrev()<CR>
nmap <silent> <Leader>cn :call CQuickfixNext()<CR>
nmap <silent> <Leader>cw :cwindow<cr>
nmap <silent> <Leader>lw :lwindow<cr>
nmap <silent> <Leader>lc :lclose<cr>
nmap <silent> <Leader>ll :call LQuickfix()<cr>
nmap <silent> <Leader>lf :call LQuickfixPrev()<CR>
nmap <silent> <Leader>ln :call LQuickfixNext()<CR>


"-----------------------------------------------------------------------
" YankStack
"-----------------------------------------------------------------------
"nmap <Leader>y :Yanks<CR>
"noremap <c-p> <Plug>yankstack_substitute_older_paste
"noremap <c-n> <Plug>yankstack_substitute_newer_paste


"-----------------------------------------------------------------------
" spelling checking
"-----------------------------------------------------------------------
" set default spelling language
setlocal spelllang=en nospell
nmap <silent> <Leader>ss :setlocal spell!<cr>
nmap <silent> <Leader>sn ]s
nmap <silent> <Leader>sp [s
nmap <silent> <Leader>sa zg
nmap <silent> <Leader>s? z=


"-----------------------------------------------------------------------
" search on-line
"-----------------------------------------------------------------------
" www.google.com
nmap <Leader>g :call OnlineDoc(0)<CR>
" www.baidu.com
nmap <Leader>a :call OnlineDoc(1)<CR>
" www.bing.com
nmap <Leader>b :call OnlineDoc(2)<CR>
" dict.cn
nmap <Leader>d :call OnlineDoc(3)<CR>
" www.iciba.com
nmap <Leader>e :call OnlineDoc(4)<CR>


"-----------------------------------------------------------------------
" searching
"-----------------------------------------------------------------------
vmap <silent> * :call VisualSelection('f', '')<CR>
vmap <silent> # :call VisualSelection('b', '')<CR>

" search in the current file
nmap <Leader><space> :vimgrep /<C-R>=expand("<cword>")<cr>/ <C-R>%<C-A><CR>

if v:version < 800
	vmap <silent> <Leader>g :call VisualSelection('ack', '')<CR>
	vmap <silent> <Leader>r :call VisualSelection('replace', '')<CR>
	vmap <silent> <Leader>R :call VisualSelection('REPLACE', '')<CR>
else
	vmap <Leader>g :call VisualSelection('ack', '')<CR>:<C-U><C-R>=@g<CR>
	vmap <Leader>r :call VisualSelection('replace', '')<CR>:<C-U><C-R>=@g<CR>
	vmap <Leader>R :call VisualSelection('REPLACE', '')<CR>:<C-U><C-R>=@g<CR>
end


"-----------------------------------------------------------------------
" Function Keys mapping
"-----------------------------------------------------------------------
" forces (re)indentation of a block of code
nmap <F1> :call UpdateCscopeDB()<CR>
" nmap <F2> - reserved for used by vim plugin visualmark.vim
nmap <F3> /<C-R>=expand("<cword>")<CR><CR>
nmap <F4> ?<C-R>=expand("<cword>")<CR><CR>
" nmap <F5> - reserved for vim lookupfile plugin
nmap <F6> :call CreateLookupFileDB("Generating > ", "~/.vim_rain/shell/lookupfile.sh " . g:LookupFile_TagExpr)<cr>
" nmap <F7> - reserved for future use
nmap <F8> vi"*n
nmap <F9> vi"#N
" nmap <F10> - reserved for guake
" nmap <F11> - reserved for vim full screen
" nmap <F12> - reserved for vim plugin visualmark.vim


"-----------------------------------------------------------------------
" other mappings
"-----------------------------------------------------------------------
" nmap for shell
nmap <silent> <Leader>s :shell<CR>

" add debug hotkeys for Makefile
nmap <silent> <Leader>m1 yiwo$(warning "==> [$(<ESC>pa)] <==")<ESC>0
nmap <silent> <Leader>m2 yiwo$(error   "==> [$(<ESC>pa)] <==")<ESC>0

" add debug hotkeys for C/C++ programming
nmap <silent> <Leader>` o#error "======>>>>>>)))))) PROGRAM CONTAINS THIS PATH !!!"<ESC>0
nmap <silent> <Leader>1 ofshow(YELLOW "---------------\n");<ESC>0
nmap <silent> <Leader>2 Ofshow(YELLOW "---------------\n");<ESC>0
nmap <silent> <Leader>3 yiwofshow(GREEN "-----[%d]-----\n", <ESC>pa);<ESC>0
nmap <silent> <Leader>4 yiwOfshow(GREEN "-----[%d]-----\n", <ESC>pa);<ESC>0
nmap <silent> <Leader>5 yiwo#pragma message(PRINT_MACRO(<ESC>pa))<ESC>0
nmap <silent> <Leader>6 yiwO#pragma message(PRINT_MACRO(<ESC>pa))<ESC>0
nmap <silent> <Leader>7 ofshow("%8p\n", __builtin_return_address(0));<ESC>0
nmap <silent> <Leader>8 oDBG_ENTERF;<ESC>0
nmap <silent> <Leader>9 oDBG_RETURN();<left><left>
nmap <silent> <Leader>0 oDBG_PRINTF;<ESC>0

