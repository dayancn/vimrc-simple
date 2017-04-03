""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: collect some useful vim functions here, and call them many
" times in other places.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! QuickFix()
	botright copen
	exec "nnoremap <silent> <buffer> q :ccl<CR>"
	exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
	exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
	exec "nnoremap <silent> <buffer> o <CR>"
	exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
	exec "nnoremap <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
	exec "nnoremap <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"
endfunction


function! PrevFile()
	:cp
endfunction


function! NextFile()
	:cn
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
	elseif a:direction == 'replace1'
		call CmdLine("s" . '/'. l:pattern . '/' . "<span class='lang' key=''><\\/span>")
		execute "normal gtgg/" . l:pattern . "^M"
		execute 'normal zrn' . '2F"'
	elseif a:direction == 'replace2'
		call CmdLine("s" . '/'. l:pattern . '/' . '_( "" )')
		execute 'normal 0f"x$F"x'
		execute "normal gtgg/" . l:pattern . "^M"
		execute 'normal zrn' . '2F"'
	elseif a:direction == 'replace3'
		call CmdLine("s" . '/'. l:pattern . '/' . '_( "" )')
		execute 'normal 0f"x$F"x'
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


" for lookupfile
function! RunShell(Msg, Shell)
	echo a:Msg . g:LookupFile_TagExpr
	call system(a:Shell)
	echo 'Done'
endfunction
