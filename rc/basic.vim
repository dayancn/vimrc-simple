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

" a buffer becomes hidden when it is abandoned, allow editing multiple unsaved buffers
set hidden

" the 'more' prompt
set more

" show line number
set number

" highlight the cusor-located line
set cursorline

" set keyword chars
set iskeyword=a-z,A-Z,48-57,_,.,-,>

" highlight search results
set hlsearch

" as it was typed so far, the matched string is highlighted.
set incsearch

" searches don't wrap around the end of the file.
set nowrapscan

" ignore case when searching
set ignorecase

" override the 'ignorecase' option if the search pattern contains upper case
" characters. only used when the search pattern is typed and 'ignorecase'
" option is on.
set smartcase

" auto read it again when changed outside
set autoread

" don't auto write on :next, etc
set noautowrite

" specify the key sequence that toggles the 'paste' option.
set pastetoggle=<F12>

" use the clipboard register '*' for all yanking, delete, change and put operations
set clipboard+=unnamed

" show (partial) command in the last line of the screen.
set showcmd

" show the current vim mode on the last line
set showmode

" when a bracket is inserted, briefly jump to the matching one.
set showmatch

" how many tenths of a second to show the matching paren
set matchtime=2

" set auto update time to 100 millisecond
set updatetime=100

" \K to get help info in split window
runtime! ftplugin/man.vim

" enable filetype detection plugins
filetype plugin indent on

" always show the cursor current position
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" number of screen lines to use for the command-line
set cmdheight=2


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
		" start with spec file template
		autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc source ~/.vim/syntax/c.vim
	augroup END
endif
