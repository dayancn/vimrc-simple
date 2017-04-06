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

" set undodir position and turn on undo function(must 'mkdir ~/.vim_rain/.undodir' first).
set undodir=~/.vim_rain/.undodir
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
set iskeyword=a-z,A-Z,48-57,_,.

" some chars preceded with a \ will get a special meaning.
set magic

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

" always show the cursor current position
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" number of screen lines to use for the command-line
set cmdheight=2

" make backspace work as we think
set backspace=eol,start,indent

" allow specified keys that move the cursor left/right to move to the previous/next line
set whichwrap+=<,>,h,l

" no error bell
set noerrorbells
set novisualbell
set t_vb=

" don't redraw while executing macros registers and other commands that have not been typed.
set lazyredraw

" always show status line for the last window
set laststatus=2

" always show tab page labels
" set showtabline=2

" specify the behavior when switching between buffers
"set switchbuf=useopen,usetab,newtab

" name of the shell to use for ! and :! commands.
set shell=/bin/bash


"-----------------------------------------------------------------------
" 3. advanced programming related settings
"-----------------------------------------------------------------------
" use spaces instead of tabs
" set expandtab
set shiftwidth=8
set tabstop=8
set smarttab

" this option changes how text is displayed, it doesn't change the text in the buffer.
set wrap
set textwidth=78

" wrap long lines
set linebreak

set autoindent
set smartindent

" set foldenable
" set foldmethod=syntax
" set foldmethod=indent
" set foldclose=all
" set foldcolumn=4

" a file that matches with one of these patterns is ignored when expanding
" wildcards, completing file or directory names, and influences the result of
" expand(), glob() and globpath() unless a flag is passed to disable this.
set wildignore=*~,*.pyc,*.o,*.obj,*.swp

" show filler lines and ignore all whitespace when vimdiff
set diffopt=filler,iwhite

" set utf8 as standard encoding
set encoding=utf8

" gives the end-of-line (<EOL>) formats
set fileformats=unix,dos

" this is a list of character encodings considered when starting to edit an existing file.
set fileencodings=ucs-bom,utf-8,gb18030,big5

" enable syntax highlighting
syntax enable

" enable filetype detection plugins
filetype plugin indent on

" options for insert mode completion
set completeopt=longest,menu


"-----------------------------------------------------------------------
" 3. autocmd
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
		autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc source ~/.vim_rain/syntax/c.vim
		" delete trailing white space on save
		" autocmd BufWrite * :call DeleteTrailingWhiteSpace()
		autocmd BufWrite \w\+ :call DeleteTrailingWhiteSpace()
		autocmd BufWrite *.txt :call DeleteTrailingWhiteSpace()
		autocmd BufWrite *.vim :call DeleteTrailingWhiteSpace()
	augroup END
endif
