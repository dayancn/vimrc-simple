" Only load this indent file once
if exists("my_java_indent")
	finish
endif
let my_java_indent = 1

" setup tabstops to 4 and indents to 4
set tabstop=4
set shiftwidth=4
set expandtab

set textwidth=78        " Set the line wrap length

" enables automatic C program indenting.
set cindent

" formatting options
"   t auto-wrap comment
"   c allows textwidth to work on comments
"   q allows use of gq* for auto formatting
"   l don't break long lines in insert mode
"   r insert '*' on <cr>
"   o insert '*' on newline with 'o'
"   n recognize numbered bullets in comments
set formatoptions=tcqlron

" vim cinoptions
set cinoptions=:4,l1,t0,g0,(4,+s
