""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: do some settings for plugins.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-----------------------------------------------------------------------
" extend runtimepath with pathogen
"-----------------------------------------------------------------------
let s:vimrc = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vimrc.'/customized/{}')
call pathogen#helptags()


"-----------------------------------------------------------------------
" YankRing.vim
"-----------------------------------------------------------------------
let g:yankring_history_dir='~/.vim_rain/'


"-----------------------------------------------------------------------
" MRU
"-----------------------------------------------------------------------
let MRU_Max_Entries = 500
let MRU_Window_Height = 15


"-----------------------------------------------------------------------
" NERD Tree
"-----------------------------------------------------------------------
let NERDTreeIgnore=['.o$[[file]]', '.tgt$[[file]]', '.x86$[[file]]']


"-----------------------------------------------------------------------
" CTRL-P
"-----------------------------------------------------------------------
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\.(git|hg|svn)$',
			\ 'file': '\.[ado]',
			\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
			\ }
let g:ctrlp_extensions = ['dir', 'changes']


"-----------------------------------------------------------------------
" bufExplorer
"-----------------------------------------------------------------------
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'


"-----------------------------------------------------------------------
" taglist.vim
"-----------------------------------------------------------------------
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_WinWidth = 48
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Auto_Open = 1


"-----------------------------------------------------------------------
" tagbar
"-----------------------------------------------------------------------
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
"let g:tagbar_autoshowtag = 1
"let g:tagbar_autopreview = 1


"-----------------------------------------------------------------------
" cscope
"-----------------------------------------------------------------------
" use :cstag instead of the default :tag behavior
"set cscopetag

" this option specifies whether to use quickfix window to show cscope results.
" if the command is added to this list, the more window will not popup, they
" are mutual!
" set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-


"-----------------------------------------------------------------------
" ack/ag - The Silver Searcher. Like ack, but faster
"-----------------------------------------------------------------------
if executable('ag')
	let g:ackprg = 'ag --vimgrep --smart-case'
endif


"-----------------------------------------------------------------------
" lookupfile setting
"-----------------------------------------------------------------------
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


"-----------------------------------------------------------------------
" acp: automatically opens popup menu for completions
"-----------------------------------------------------------------------
let g:acp_enableAtStartup = 0


"-----------------------------------------------------------------------
" supertab
"-----------------------------------------------------------------------
" let loaded_supertab = 1


"-----------------------------------------------------------------------
" syntastic
"-----------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


"-----------------------------------------------------------------------
" vim-powerline
"-----------------------------------------------------------------------
" disable powerline
" let g:Powerline_loaded = 1


"-----------------------------------------------------------------------
" lightline.vim
"-----------------------------------------------------------------------
let g:loaded_lightline = 1

" use this is because ubuntu 14.04 doesn't support unicode U+1F512 LOCK
if 1
	" to have the effect of powline
	let g:lightline = {
				\ 'colorscheme': 'wombat',
				\ 'active': {
				\   'left': [ ['mode', 'paste'],
				\             ['fugitive', 'readonly', 'filename', 'modified'] ]
				\ },
				\ 'component': {
				\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
				\   'filename': '%t',
				\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
				\ },
				\ 'component_visible_condition': {
				\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
				\   'readonly': '(&filetype!="help"&& &readonly)',
				\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
				\ },
				\ 'separator': { 'left': '', 'right': '' },
				\ 'subseparator': { 'left': '|', 'right': '|' }
				\ }

else
	" to have the effect of powline and show/hide the fileds according to the
	" width of current window.
	let g:lightline = {
				\ 'colorscheme': 'wombat',
				\ 'mode_map': { 'c': 'NORMAL' },
				\ 'active': {
				\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
				\ },
				\ 'component_function': {
				\   'modified': 'LightlineModified',
				\   'readonly': 'LightlineReadonly',
				\   'fugitive': 'LightlineFugitive',
				\   'filename': 'LightlineFilename',
				\   'fileformat': 'LightlineFileformat',
				\   'filetype': 'LightlineFiletype',
				\   'fileencoding': 'LightlineFileencoding',
				\   'mode': 'LightlineMode',
				\ },
				\ 'separator': { 'left': '', 'right': '' },
				\ 'subseparator': { 'left': '|', 'right': '|' }
				\ }

	function! LightlineModified()
		return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! LightlineReadonly()
		return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '🔒 ' : ''
	endfunction

	function! LightlineFilename()
		return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
					\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
					\  &ft == 'unite' ? unite#get_status_string() :
					\  &ft == 'vimshell' ? vimshell#get_status_string() :
					\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
					\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
	endfunction

	function! LightlineFugitive()
		if &ft !~? 'vimfiler\|gundo' && winwidth(0) > 70 && exists("*fugitive#head")
			let branch = fugitive#head()
			return branch !=# '' ? branch : ''
		endif
		return ''
	endfunction

	function! LightlineFileformat()
		return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! LightlineFiletype()
		return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
	endfunction

	function! LightlineFileencoding()
		return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
	endfunction

	function! LightlineMode()
		return winwidth(0) > 60 ? lightline#mode() : ''
	endfunction

endif


"-----------------------------------------------------------------------
" colorscheme
"-----------------------------------------------------------------------
" set extra options when running in GUI mode
if has("gui_running")
	set t_Co=256
	set background=dark

	" set font according to system
	set guifont=Monospace\ 10

	" disable scrollbars
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=T
	set guioptions-=e
	set guioptions+=c

	"set guitablabel=%M\ %t
	let g:solarized_degrade=1
	"colorscheme solarized
	"colorscheme peaksea
	colorscheme gruvbox
else
	set t_Co=256
	set background=dark
	"set background=light

	let g:solarized_termcolors=256
	colorscheme gruvbox
	"colorscheme peaksea
	"colorscheme solarized
	"colorscheme peachpuff
	"hi CursorLine	ctermfg=NONE	ctermbg=238	cterm=NONE
endif
