""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Rain Ma <58208797@163.com>
" Date: 2017-04-03
" Description: do basic vim settings here.
" Sections:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-----------------------------------------------------------------------
" 1. Basic Settings
"-----------------------------------------------------------------------
" make vim behave in a more useful way.
set nocompatible

" set command-lines history size to 100.
set history=100

" read/write .viminfo, remember marks for 100 files, store not more than 1000 lines for each register.
set viminfo='100,<1000

" remember info about open buffers on close
set viminfo^=%

" set undodir position and turn on undo function(must 'mkdir ~/.vim/.undodir' first).
set undodir=~/.vim/.undodir
set undofile

" turn off backup off
set nobackup
set nowritebackup
set noswapfile
" keep a backup file
" set backup
" add ~ to the end of backup files
" set backupext=~

" show line number
set number

" highlight the cusor-located line
set cursorline

" highlight search results
set hlsearch

" as it was typed so far, the matched string is highlighted.
set incsearch

" auto read it again when changed outside
set autoread

" don't auto write on :next, etc
set noautowrite

" \K to get help info in split window
runtime! ftplugin/man.vim

" set keyword chars
set iskeyword=a-z,A-Z,48-57,_,.,-,>

" enable filetype detection plugins
filetype plugin indent on


"-----------------------------------------------------------------------
" 2. autocmd
"-----------------------------------------------------------------------
if has("autocmd")
	augroup VimGroup
		autocmd!
		autocmd BufWritePost ~/.vim/rc/*.vim source ~/.vim/vimrc
	augroup END

	augroup LinuxGroup
		autocmd!
		" return to last edit position after re-opening files
		autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
		" don't write swapfile on most commonly used directories for NFS mounts or USB sticks
		autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=/tmp,/var/tmp
	augroup END
endif
