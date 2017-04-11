# README

This porject is used to record my 10 years for vim study on Linux C programme!


# KNOWN ISSUES

##  cscopequickfix option

### In syntax/c.vim, preview window may conflict with cscopequickfix settings!

" set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i- " not work
" set cscopequickfix=s-,c-,d-,i-,t-,e- " work
func PreviewWord()


### if cscopequickfix option contains 'g-', in gvim, you can use <c-leftmouse> to jump but can't use <c-rightmouse> jump back.
