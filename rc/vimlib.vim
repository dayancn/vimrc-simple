""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: collect some useful vim functions here, and call them many
" times in other places.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! CQuickfix()
	botright copen
	exec "nnoremap <silent> <buffer> q :ccl<CR>"
	exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
	exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
	exec "nnoremap <silent> <buffer> o <CR>"
	exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
	exec "nnoremap <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
	exec "nnoremap <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"
endfunction


function! CQuickfixPrev()
	:cp
endfunction


function! CQuickfixNext()
	:cn
endfunction


function! LQuickfix()
	botright lwindow
	exec "nnoremap <silent> <buffer> q :lcl<CR>"
	exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
	exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
	exec "nnoremap <silent> <buffer> o <CR>"
	exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
	exec "nnoremap <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
	exec "nnoremap <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"
endfunction


function! LQuickfixPrev()
	:lp
endfunction


function! LQuickfixNext()
	:lne
endfunction


" delete trailing white space on save
function! DeleteTrailingWhiteSpace()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc


function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction


function! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/\C\<'. l:pattern . '\>/' . ' **/*.' . a:extra_filter)
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction


" don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction


" search on-line
function! OnlineDoc(search_engine)
	" let s:browser = "/opt/google/chrome/chrome"
	" let s:browser = "/usr/bin/chromium-browser"
	let s:browser = "/usr/bin/firefox"
	let s:wordUnderCursor = expand("<cword>")

	if a:search_engine == 0
		let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
	elseif a:search_engine == 1
		let s:url = "http://www.baidu.com/s?wd=".s:wordUnderCursor
	elseif a:search_engine == 2
		let s:url = "http://cn.bing.com/search?q=".s:wordUnderCursor
	elseif a:search_engine == 3
		let s:url = "http://dict.cn/".s:wordUnderCursor
	elseif a:search_engine == 4
		let s:url = "http://www.iciba.com/".s:wordUnderCursor
	endif

	let s:cmd = "silent !" . s:browser . " " . s:url
	execute  s:cmd
	redraw!
endfunction


" run shell command
function! RunShell(Shell)
	call system(a:Shell)
endfunction


" for lookupfile
function! CreateLookupFileDB(Msg, Shell)
	echo a:Msg . g:LookupFile_TagExpr
	call RunShell(a:Shell)
	echo 'Done'
endfunction


" update ctags, cscope db and reset
function! UpdateCscopeDB()
	echo 'Preparing for cscope and ctags ...'
	call RunShell("CC t")
	cscope reset
	echo 'Done'
endfunction


" ---------------------------------------------------------------------------
" TabMessage: Put output of commands in a new tab."
" ---------------------------------------------------------------------------
function! TabMessage(cmd)
	redir => message
	silent execute a:cmd
	redir END
	tabnew
	silent put=message
	set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
