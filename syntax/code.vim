" matches should be done each time load source files!
syn match ErrorLeadSpace /^ \+/       " highlight any leading spaces
syn match ErrorTailSpace /\s\+$/      " highlight any trailing spaces
syn match cErrorTailSpace /\s\+$/ contained " highlight any trailing spaces
"syn match Error80        /\%>80v.\+/ " highlight anything past 80 in red

" process only once
if exists("my_code_syntax") || &compatible
	finish
else
	let my_code_syntax = 1
endif

if has("gui_running")
	hi Error80         gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi ErrorLeadSpace  gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi ErrorTailSpace  gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi cErrorTailSpace gui=NONE guifg=#ffffff guibg=#6e2e2e
else
	hi Error80         cterm=NONE ctermfg=NONE ctermbg=52
	hi ErrorLeadSpace  cterm=NONE ctermfg=NONE ctermbg=52
	hi ErrorTailSpace  cterm=NONE ctermfg=NONE ctermbg=52
	hi cErrorTailSpace cterm=NONE ctermfg=NONE ctermbg=52
endif
