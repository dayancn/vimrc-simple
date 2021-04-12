" Only load this indent file once
if exists("my_c_indent")
	finish
endif
let my_c_indent = 1

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

set cinoptions=:0,l1,t0,g0,+10,(0,+s    " Linux Kernel CodingStyle

" folding
"  - reserve 4 columns on the left for folding tree
"  - fold by syntax, use {}'s
"  - start with all folds open
"if winwidth(0) > 80
"	set foldcolumn=4
"endif
"set fdm=syntax
"syn region myFold start="{" end="}" transparent fold
"%foldopen!
"  - bind meta< and meta> for fold colapse and extend
"map <m-,> :foldclose<CR>
"map <m-.> :foldopen<CR>
