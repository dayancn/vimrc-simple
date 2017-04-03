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


