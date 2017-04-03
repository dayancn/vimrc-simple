" ===========================================================================
" The customized vimrc, 2007-06-18.
" ===========================================================================

let maplocalleader=','          " all my macros start with ,

map <LocalLeader>ce :edit ~/.vimrc<cr>
map <LocalLeader>cs :source ~/.vimrc<cr>

"re-read configureation of vim if .vimrc is saved
augroup VimConfig
   au!
   autocmd BufWritePost ~/.vimrc so ~/.vimrc
   autocmd BufWritePost vimrc so ~/.vimrc
augroup END


" ---------------------------------------------------------------------------
" Basic Settings
" ---------------------------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
syntax on
filetype plugin indent on       " enable filetype detection
set nocompatible                " Use Vim defaults (much better!)
set iskeyword=@,48-57,_,128-167,224-235
set fileformats=unix,dos
set fileencodings=ucs-bom,utf-8,gb18030,big5
" ignore these file types when opening
set wildignore=*.pyc,*.o,*.obj,*.swp
set wildmenu                    " : menu has tab completion, etc
set viminfo='100,<1000,%        " read/write a .viminfo file, don't store more than 1000 lines of registers
set viminfo^=%                  " Remember info about open buffers on close
set history=100                 " keep 100 lines of command line history
set ruler                       " show the cursor position all the time
set rulerformat=%15(%c%V\ %p%%%)
set laststatus=2
"set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set titlestring=%t%(\ [%R%M]%)
set number                      " show the line number
set hidden                      " allow editing multiple unsaved buffers
set more                        " the 'more' prompt
set autoread                    " watch for file changes by other programs
set noautowrite                 " don't automatically write on :next, etc
"set visualbell                  " visual beep
"set backup                      " keep a backup file
"set backupext=~                 " add ~ to the end of backup files
"set patchmode=.org              " only produce *.org if not there
"set cmdheight=2                 " make command line two lines high
"set nowrap
"set nowrapscan
set mouse&
set hlsearch                    " switch on highlighting the last used search pattern.
set incsearch                   " While typing a search command, show where the pattern, as it was typed so far, matches.
set scrolloff=5                 " keep at least 5 lines above/below cursor
set sidescrolloff=5             " keep at least 5 columns left/right of cursor
set showmode                    " dislplay the current mode
set showcmd                     " dislplay the uncompeted command
set showmatch                   " show match brackets
set cursorline                  " Highlight the screen line of the cursor with CursorLine
"set list
"set listchars=tab:>-,trail:-
"set whichwrap=b,s,<,>,[,]
" command <TAB> completion, list matches and complete the longest common part
set wildmode=list:longest,full
set completeopt=longest,menu
set clipboard+=unnamed
set pastetoggle=<F12>
set diffopt=filler,iwhite       " ignore all whitespace and sync


" ---------------------------------------------------------------------------
" setup for the visual environment
" ---------------------------------------------------------------------------
if has('gui_running')
   set background=light
   set guioptions-=T
   set guioptions-=m
   set guioptions+=c
   "set guifont=-schumacher-clean-medium-r-normal-*-*-120-*-*-c-*-iso646.1991-irv
   "set guifont=Monospace\ 8,Terminal\ 8,fixed
   "set guifont=ProggyCleanTT\ 12
else
   "set background=dark
   set background=light
endif

if $TERM =~ '^xterm'
   set t_Co=256 
elseif $TERM =~ '^screen-bce'
   set t_Co=256                 " just guessing
elseif $TERM =~ '^rxvt'
   set t_Co=88
elseif $TERM =~ '^linux'
   set t_Co=8
else
   set t_Co=16
endif

if &term=="xterm"
   set t_Co=8
   set t_Sb=^[[4%dm
   set t_Sf=^[[3%dm
endif

"colorscheme desert              " 16 colour
"colorscheme ps_color
"colorscheme desert256           " 256 colour
"colorscheme gardener            " 256 colour
"colorscheme inkpot              " 256 colour
"colorscheme blacklight          " 256 colour

"let g:inkpot_black_background=1
"colorscheme my_inkpot           " 256 colour


" ---------------------------------------------------------------------------
" Program Settings
" ---------------------------------------------------------------------------
set tabstop=8                           " a tab equal to 4 spaces
set shiftwidth=8                        " Number of spaces to use for each step of (auto)indent.
set expandtab                           " use space expand tab
set noexpandtab                         " use tabs, not spaces
set smarttab                            " make <tab> and <backspace> smarter
set backspace=indent,eol,start          " allow backspacing over everything in insert mode
" Settings for programming
set cindent
set autoindent
set smartindent                         " always set autoindenting on
set cinoptions=:0,l1,t0,g0,+10,(0,+s    " Linux Kernel CodingStyle
set formatoptions=tcqlron

"set foldenable
"set foldmethod=syntax
"set foldmethod=indent
"set foldclose=all
"set foldcolumn=4


" ---------------------------------------------------------------------------
" ChangeLog
" ---------------------------------------------------------------------------
" autoinsert date on <Ydt>
":iab <Ydt> <C-R>=strftime("%a %b %d %T %Y")<CR> Bart
:iab <new> <C-R>=strftime("%c")<CR> Rain Ma <58208797@163.com>


" ---------------------------------------------------------------------------
" Hot Key
" ---------------------------------------------------------------------------
"imap <C-F3> <C-o>:reg<CR>
"nmap <C-F4> :reg<CR>
" forces (re)indentation of a block of code
nmap <F3> /<C-R>=expand("<cword>")<CR><CR>
nmap <F4> ?<C-R>=expand("<cword>")<CR><CR>
nmap <F5> :make!<CR>
nmap <F6> :cw<CR>
nmap <space> :Tlist<CR>
nmap <LocalLeader>ma :set mouse=a<CR>
nmap <LocalLeader>mc :set mouse&<CR>
nmap <LocalLeader>nh :nohlsearch<cr>
"map <F7> :set paste<CR>
"map <F8> :set nopaste<CR>
nmap <C-J> vip=


" ---------------------------------------------------------------------------
" autocmd
" ---------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands
if has("autocmd")
   augroup fedora
   autocmd!
   " In text files, always limit the width of text to 78 characters
   autocmd BufRead *.txt set tw=78
   " When editing a file, always jump to the last cursor position
   autocmd BufReadPost *
   \ if line("'\"") > 0 && line ("'\"") <= line("$") |
   \   exe "normal! g'\"" |
   \ endif
   " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
   autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
   " start with spec file template
   autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
   autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc source ~/.vim/c.vim
   augroup END
endif


" ---------------------------------------------------------------------------
" \K to get help info in split window
" ---------------------------------------------------------------------------
runtime! ftplugin/man.vim


"----------------------------------------
" Set Search Path for [ + TAB
"----------------------------------------
set path&


"----------------------------------------
" Set Search Path for 'ctags'
"----------------------------------------
set tags&
set tags+=$PROJ_ROOT_PATH\/tags
set tags+=,../tags
set tags+=,../../tags
set tags+=,../../../tags
set tags+=,../../../../tags
set tags+=,../../../../../tags
set tags+=,../../../../../../tags
set tags+=,../../../../../../../tags
set tags+=,../../../../../../../../tags
set tags+=,../../../../../../../../../tags
set tags+=,../../../../../../../../../../tags


" ---------------------------------------------------------------------------
" Tabs Page
" ---------------------------------------------------------------------------
map <LocalLeader>tc :tabnew %<cr>
map <LocalLeader>td :tabclose<cr>
map <LocalLeader>th :tab help<cr>
map <LocalLeader>tm :tabmove
map <LocalLeader>tn :tabnext<cr>
map <LocalLeader>ts :tab sp<cr>
map <LocalLeader>tp :tabprev<cr>

" "dcraven" pasted "TabMessage: Put output of ex commands in a new tab." 
" (10 lines, 287B) at http://sial.org/pbot/20504

"TabMessage: Put output of ex commands in a new tab.
function! TabMessage(cmd)
   redir => message
   silent execute a:cmd
   redir END
   tabnew
   silent put=message
   set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)


" ---------------------------------------------------------------------------
" Tag list (ctags)
" ---------------------------------------------------------------------------
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Winwidth=45
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Auto_Open = 1


" ---------------------------------------------------------------------------
" cscope
" ---------------------------------------------------------------------------
" Source a global configuration file if available
source ~/.vim/cscope_maps.vim
"set nocst
set cscopequickfix=s-,c-,d-,i-,t-,e-


" ---------------------------------------------------------------------------
" Git Branch Info
" (http://www.vim.org/scripts/script.php?script_id=2258)
" ---------------------------------------------------------------------------
" Source a global configuration file if available
source ~/.vim/plugin/git-branch-info.vim
set statusline=%<%F%y%a%1*%h%m%r%*%=%2*\ Dec:%b\ Hex:0X%B\ %*\ [%l,%c%V\,%p%%]\ [%{GitBranchInfoString()}]
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
hi User2 term=inverse,bold cterm=inverse,bold ctermfg=green


" ---------------------------------------------------------------------------
"  Search
" ---------------------------------------------------------------------------

function! OnlineDoc() 
   let s:browser = "/opt/google/chrome/chrome"
   let s:wordUnderCursor = expand("<cword>") 

   if &ft == "cpp" || &ft == "c" || &ft == "ruby" || &ft == "php" || &ft == "python" 
      let s:url = "http://www.baidu.com/s?wd=".s:wordUnderCursor
   elseif &ft == "vim"
      let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
   else 
      return 
   endif 

   let s:cmd = "silent !" . s:browser . " " . s:url 
   "echo  s:cmd 
   execute  s:cmd 
   redraw!
endfunction 

" online doc search 
map <LocalLeader>k :call OnlineDoc()<CR>


" ---------------------------------------------------------------------------
"  file management, note 'set hidden' above
" ---------------------------------------------------------------------------

" Move to next file
map <LocalLeader>fn :next<cr>
" Move to previous file
map <LocalLeader>ff :previous<cr>


" ---------------------------------------------------------------------------
"  buffer management, note 'set hidden' above
" ---------------------------------------------------------------------------

" Move to next buffer
map <LocalLeader>bn :bn<cr>
" Move to previous buffer
map <LocalLeader>bf :bp<cr>
" List open buffers
map <LocalLeader>bb :ls<cr>


" ---------------------------------------------------------------------------
"  QuickView
" ---------------------------------------------------------------------------

" Move to next buffer
map <LocalLeader>cn :cn<cr>
" Move to previous buffer
map <LocalLeader>cf :cp<cr>
" List open buffers
map <LocalLeader>cc :cw<cr>


" ---------------------------------------------------------------------------
" spelling...
" ---------------------------------------------------------------------------
if v:version >= 700
   let b:lastspelllang='en'
   function! ToggleSpell()
      if &spell == 1
         let b:lastspelllang=&spelllang
         setlocal spell!
      elseif b:lastspelllang
         setlocal spell spelllang=b:lastspelllang
      else
         setlocal spell spelllang=en
      endif
   endfunction

   nmap <LocalLeader>ss :call ToggleSpell()<CR>

   setlocal spell spelllang=en
   setlocal nospell
endif
