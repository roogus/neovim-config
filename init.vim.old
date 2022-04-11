" Enabling comments nvim-gtk: use 'true' or 'false' (default: 'false')
let g:dbg = 'false'

" For MSWin:
" User Scope Only
"   %USERPROFILE% = C:\Users\<username>
"   %CSIDL_PROFILE% = C:\Users\<username>
"   %CSIDL_LOCAL_APPDATA% = C:\Users\<username>\AppData\Local
" System Scope
"   %CSIDL_COMMON_APPDATA% = C:\ProgramData
" Determine what OS we're using, and set paths:
if !exists("g:os")
  if has("win64") || has("win32") || has("win16")
    let g:os = "Windows"
    let g:config_root = substitute(system('echo %USERPROFILE%'), '\n', '', '') . '\AppData\Local\nvim'
    let g:bkp_dir = g:config_root . '\files\backup'
    let g:undo_dir = g:config_root . '\files\undo'
    let g:swp_dir = g:config_root . '\files\swap'
    let g:vimplug_dir = g:config_root . '\plugged'
  else
    let g:os = substitute(system('uname'), '\n', '', '')
    let g:config_root = expand("~") . "/.config/nvim"
    let g:bkp_dir = g:config_root . '/files/backup'
    let g:undo_dir = g:config_root . '/files/undo'
    let g:swp_dir = g:config_root . '/files/swap'
    let g:vimplug_dir = g:config_root . '/plugged'
  endif
endif

if g:dbg == 'true'
  echom '[INFO] Running on: ' . g:os
  echom '[INFO] Using config directory: ' . g:config_root
endif

" Prepend user's local nvim runtime to runtimepath
set runtimepath^=g:config_root

" Create backupdir if it doesn't exist.
if isdirectory(g:bkp_dir) == 0
  if g:os == 'Windows'
    execute 'silent !md ' . g:bkp_dir
  else
    execute 'silent !mkdir -p ' . g:bkp_dir
  endif
  if g:dbg == 'true'
    if isdirectory(g:bkp_dir) == 0
      echom("[ERROR] Failed to create backupdir: " . g:bkp_dir)
    else
      echom("[INFO] Successfully created backupdir: " . g:bkp_dir)
    endif
  endif
endif

" Change vim's backup file location.
"set backupdir-=.
"set backupdir+=.
"set backupdir-=$HOME\
let &backupdir=g:bkp_dir

" Create swapdir if it doesn't exist.
if isdirectory(g:swp_dir) == 0
  if g:os == 'Windows'
    execute 'silent !md ' . g:swp_dir
  else
    execute 'silent !mkdir -p ' . g:swp_dir
  endif
  if g:dbg == 'true'
    if isdirectory(g:swp_dir) == 0
      echom("[ERROR] Failed to create (swap)directory: " . g:swp_dir)
    else
      echom("[INFO] Successfully created (swap)directory: " . g:swp_dir)
    endif
  endif
endif

" Change vim's swap file location.
"set directory=.g:swp_dir//
"set directory^=g:swp_dir//
"set directory+=$TMP//
"set directory+=.
let &directory=g:swp_dir

" viminfo stores the the state of your previous editing session
"set viminfo+=n$HOME/.config/nvim/files/viminfo

" Create undodir if it doesn't exist.
if isdirectory(g:undo_dir) == 0
  if g:os == 'Windows'
    execute 'silent !md ' . g:undo_dir
  else
    execute 'silent !mkdir -p ' . g:undo_dir
  endif
  if g:dbg == 'true'
    if isdirectory(g:undo_dir) == 0
      echom("[ERROR] Failed to create undodir: " . g:undo_dir)
    else
      echom("[INFO] Successfully created undodir: " . g:undo_dir)
    endif
  endif
endif

" Change vim's undo file location.
"set undodir=.g:undo_dir//
let &undodir=g:undo_dir


set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set undolevels=1000
set undoreload=10000

" More natural split opening
set splitbelow
set splitright

" Resizing splits (Vim defaults)
" Max out height of curr split
" ctrl + w _
" Max out width of curr split
" ctrl + w |
" Normalize all split sizes
" ctrl + w =

" Additional split manipulation (Vim defaults)
" Swap top/bottom or left/right split
" Ctrl+W R
" Break out current window into a new tabview
" Ctrl+W T
" Close every window in the current tabview but the current one
" Ctrl+W o

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \	execute "normal! g`\"" |
    \ endif
augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

if g:os == 'Windows'
  if g:dbg == 'true'
    echom "[INFO] Sourcing " . g:config_root . '\bootstrap.vim'
  endif
  execute "source " g:config_root . '\bootstrap.vim'

  if filereadable(g:config_root . '\vimrc_local')
    if g:dbg == 'true'
      echom "[INFO] Sourcing " . g:config_root . '\vimrc_local'
    endif
    execute "source " g:config_root . '\vimrc_local'
  else
    if g:dbg == 'true'
      echom "[INFO] Not found: " . g:config_root . '\vimrc_local'
    endif
  endif
else
  if g:dbg == 'true'
    echom "[INFO] Sourcing " . g:config_root . '/bootstrap.vim'
  endif
  execute "source " g:config_root . '/bootstrap.vim'

  if filereadable(g:config_root . '/vimrc_local')
    if g:dbg == 'true'
      echom "[INFO] Sourcing " . g:config_root . '/vimrc_local'
    endif
    execute "source " g:config . '/vimrc_local'
  else
    if g:dbg == 'true'
      echom "[INFO] Not found: " . g:config_root . '/vimrc_local'
    endif
  endif
endif
