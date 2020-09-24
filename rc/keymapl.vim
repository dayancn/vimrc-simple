""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: write customized mapping here for unity.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"-----------------------------------------------------------------------
" useful mappings for file buffers
"-----------------------------------------------------------------------
" move to next file
nmap <silent> <LocalLeader>fn :next<cr>

" move to previous file
nmap <silent> <LocalLeader>ff :previous<cr>

" move to next buffer
nmap <silent> <LocalLeader>bn :bn<cr>

" move to previous buffer
nmap <silent> <LocalLeader>bf :bp<cr>

" list open buffers
nmap <silent> <LocalLeader>bb :ls<cr>

" close the current buffer
nmap <silent> <LocalLeader>bd :Bclose<cr>


"-----------------------------------------------------------------------
" tig - Vim plugin to use Tig as a git client
"-----------------------------------------------------------------------
nmap <silent> <LocalLeader>tl :Tig log<cr>
nmap <silent> <LocalLeader>ts :Tig show<cr>
nmap <silent> <LocalLeader>tb :TigBlame<cr>
nmap <silent> <LocalLeader>t  :TigOpenProjectRootDir<cr>
nmap <silent> <LocalLeader>tf :TigOpenCurrentFile<cr>
nmap <silent> <LocalLeader>tg :TigGrep <c-r>=expand('<cword>')<cr><cr>
nmap <silent> <LocalLeader>tt :TigGrepResume<cr>


"-----------------------------------------------------------------------
" vim-fugitive
"-----------------------------------------------------------------------
nmap <silent> <LocalLeader>ge :Gedit<cr>
nmap <silent> <LocalLeader>gs :Gsplit<cr>
nmap <silent> <LocalLeader>gv :Gvsplit<cr>
nmap <silent> <LocalLeader>gt :Gtabedit<cr>
nmap <silent> <LocalLeader>gd :Gdiff<cr>
nmap <silent> <LocalLeader>g  :Gstatus<cr>
nmap <silent> <LocalLeader>gb :Gblame<cr>
nmap <silent> <LocalLeader>gm :Gmove<cr>
nmap <silent> <LocalLeader>gr :Gremove<cr>
nmap <silent> <LocalLeader>gg :Ggrep<cr>
nmap <silent> <LocalLeader>gl :Glog<cr>
nmap <silent> <LocalLeader>gr :Gread<cr>
nmap <silent> <LocalLeader>gw :Gwrite<cr>
nmap <silent> <LocalLeader>gB :Gbrowse<cr>


"-----------------------------------------------------------------------
" Cscove(new name for this plugin, since cscope.vim is used too widely.)
" is a smart cscope helper for vim.
"-----------------------------------------------------------------------
nmap <silent> <LocalLeader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nmap <silent> <LocalLeader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nmap <silent> <LocalLeader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nmap <silent> <LocalLeader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nmap <silent> <LocalLeader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nmap <silent> <LocalLeader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nmap <silent> <LocalLeader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nmap <silent> <LocalLeader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nmap <silent> <LocalLeader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nmap <silent> <LocalLeader>fi :call CscopeFind('i', expand('<cword>'))<CR>


"-----------------------------------------------------------------------
" vim_current_word
"-----------------------------------------------------------------------
let g:vim_current_word#enabled = 0
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 0
nmap <silent> <LocalLeader>a :VimCurrentWordToggle<CR>
