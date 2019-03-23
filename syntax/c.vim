" useful for arranging a block of comments
" nmap <C-J> vip=

syn match ErrorLeadSpace /^ \+/       " highlight any leading spaces
syn match ErrorTailSpace /\s\+$/      " highlight any trailing spaces
syn match cErrorTailSpace /\s\+$/ contained " highlight any trailing spaces
"syn match Error80        /\%>80v.\+/ " highlight anything past 80 in red

" more types...
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
" fsap2/pthreads/osxstd.h
syn keyword cType BOOLEAN BOOL1 CHR1 INT1 UINT1 BYTE VOID INT2 UINT2 INT4 UINT4 FLT4 DBL8 FS_ULONG FS_LONG AR_UINT8 VINT1 VUINT1 VINT2 VUINT2 VINT4 VUINT4
syn keyword cOperator likely unlikely


" process only once
if exists("my_vim_c_vim_loaded") || &compatible
	finish
else
	let my_vim_c_vim_loaded = 1
endif


if has("gui_running")
	hi Error80         gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi ErrorLeadSpace  gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi ErrorTailSpace  gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi cErrorTailSpace gui=NONE guifg=#ffffff guibg=#6e2e2e
else
	hi Error80         cterm=NONE ctermfg=7 ctermbg=1
	hi ErrorLeadSpace  cterm=NONE ctermfg=7 ctermbg=1
	hi ErrorTailSpace  cterm=NONE ctermfg=7 ctermbg=1
	hi cErrorTailSpace cterm=NONE ctermfg=7 ctermbg=1
endif


" setup tabstops to 8 and indents to 8
set tabstop=8
set shiftwidth=8
set noexpandtab
" line wrapping in c comments not c code
set textwidth=78        " Set the line wrap length
" enables automatic C program indenting.
set cindent


" C-mode formatting options
"   t auto-wrap comment
"   c allows textwidth to work on comments
"   q allows use of gq* for auto formatting
"   l don't break long lines in insert mode
"   r insert '*' on <cr>
"   o insert '*' on newline with 'o'
"   n recognize numbered bullets in comments
set formatoptions=tcqlron


" C-mode options (cinoptions==cino)
" N	number of spaces
" Ns	number of spaces * shiftwidth
" >N	default indent
" eN	extra indent if the { is at the end of a line
" nN	extra indent if there is no {} block
" fN	indent of the { of a function block
" gN    indent of the C++ class scope declarations (public, private, protected)
" {N	indent of a { on a new line after an if,while,for...
" }N	indent of a } in reference to a {
" ^N	extra indent inside a function {}
" :N	indent of case labels
" =N	indent of case body
" lN	align case {} on the case line
" tN	indent of function return type
" +N	indent continued algibreic expressions
" cN	indent of comment line after /*
" )N	vim searches for closing )'s at most N lines away
" *N	vim searches for closing */ at most N lines away
set cinoptions=:0,l1,t0,g0,+10,(0,+s    " Linux Kernel CodingStyle


" folding
"  - reserve 4 columns on the left for folding tree
"  - fold by syntax, use {}'s
"  - start with all folds open
if winwidth(0) > 80
	" set foldcolumn=4
endif


"set fdm=syntax
"syn region myFold start="{" end="}" transparent fold
"%foldopen!
"  - bind meta< and meta> for fold colapse and extend
"map <m-,> :foldclose<CR>
"map <m-.> :foldopen<CR>


" next block is from chapter 10 of the windows.txt vim help file
" :h preview-window
"
":au! CursorHold *.[ch] nested call PreviewWord()
:nmap <LocalLeader>pt :call PreviewWord()<cr>
:func PreviewWord()
:	if &previewwindow                  " don't do this in the preview window
:		return
:	endif
:	let w = expand("<cword>")          " get the word under cursor
:	if w =~ '\a'                       " if the word contains a letter
:
:		" Delete any existing highlight before showing another tag
:		silent! wincmd P           " jump to preview window
:		if &previewwindow          " if we really get there...
:			match none         " delete existing highlight
:			wincmd p           " back to old window
:		endif
:
:		" Try displaying a matching tag for the word under the cursor
:		try
:			exe "ptag! " . w
:		catch
:			return
:		endtry
:
:		silent! wincmd P           " jump to preview window
:		if &previewwindow          " if we really get there...
:			if has("folding")
:				silent! .foldopen      " don't want a closed fold
:			endif
:			call search("$", "b")          " to end of previous line
:			let w = substitute(w, '\\', '\\\\', "")
:			call search('\<\V' . w . '\>') " position cursor on match
:			" Add a match highlight to the word at this position
:			hi previewWord term=bold ctermbg=green guibg=green
:			exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
:			wincmd p                       " back to old window
:		endif
:	endif
:endfun
