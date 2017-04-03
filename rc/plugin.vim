""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: do some settings for plugins.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-----------------------------------------------------------------------
" extend runtimepath with pathogen
"-----------------------------------------------------------------------
call pathogen#infect('customized/{}')
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_WinWidth = 48
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Auto_Open = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use :cstag instead of the default :tag behavior
"set cscopetag

" use quickfix window to show the cscope commands results
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-


" ---------------------------------------------------------------------------
" lookupfile setting
" ---------------------------------------------------------------------------
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0

if $PWD =~ $PROJ_ROOT_PATH
	let g:LookupFile_TagExpr="\"" . $PROJ_ROOT_PATH . "/.lookupfile\""
else
	" TODO: make it can use ~/.lookupfile!
	" let g:LookupFile_TagExpr="\"" . $HOME. "/.lookupfile\""
	let g:LookupFile_TagExpr='".lookupfile"'
endif


" ---------------------------------------------------------------------------
" acp: automatically opens popup menu for completions
" ---------------------------------------------------------------------------
let g:acp_enableAtStartup = 0


" ---------------------------------------------------------------------------
" supertab
" ---------------------------------------------------------------------------
let loaded_supertab = 1
