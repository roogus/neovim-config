" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

" Enable line numbers.
set number

" Don't underline current line
hi CursorLine cterm=none
hi CursorLine gui=none

"setlocal spell

" Set the available python interpreters

if has("gui_running")
    if g:os == "Darwin"
      if g:dbg == 'true'
	echom "[INFO] Using /usr/bin/python2.7"
      endif
      let g:python_host_prog = '/usr/bin/python2.7'
      if g:db == 'true'
	echom "[INFO] Using /usr/bin/python3.6"
      endif
      let g:python3_host_prog = '/usr/bin/python3.6'
    elseif g:os == "Linux"
      if g:dbg == 'true'
	echom "[INFO] Using /usr/bin/python2.7"
      endif
      let g:python_host_prog = '/usr/bin/python2.7'
      if g:db == 'true'
	echom "[INFO] Using /usr/bin/python3.6"
      endif
      let g:python3_host_prog = '/usr/bin/python3.6'
    elseif g:os == "Windows"
      if g:dbg == 'true'
	echom "[INFO] Using C:\python2\python2"
      endif
      let g:python_host_prog = 'C:\python2\python2'
      if g:db == 'true'
	echom "[INFO] Using C:\python3\python3"
      endif
      let g:python3_host_prog = 'C:\python3\python3'
    endif
endif

" Enable invisible characters.
"set list

" INDENTATION: Ensure all numerical values are equal unless you know what
" you're doing...
" Use spaces not tabs, comment out for hard tabs
set expandtab
set softtabstop=2

" For hard tabs, comment out 'set expandtab' and 'set softtabstop' above,
" then uncomment the following line.
"set tabstop=2

" Set a default indent, but vim-sleuth should adjust it.
set shiftwidth=2

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

let mapleader = ","

" Copy to clipboard
vnoremap    <leader>y   "+y
nnoremap    <leader>Y   "+yg_
nnoremap    <leader>y   "+y
nnoremap    <leader>yy  "+yy

nnoremap    <leader>p   "+p
nnoremap    <leader>P   "+P
vnoremap    <leader>p   "+p
vnoremap    <leader>P   "+P

" Window navigation function
func! s:mapMoveToWindowInDirection(direction)
	func! s:maybeInsertMode(direction)
		stopinsert
		execute "wincmd" a:direction

		if &buftype == 'terminal'
			startinsert!
		endif
	endfunc

	execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
		\ "<C-\\><C-n>"
		\ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
	execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
		\ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
	call s:mapMoveToWindowInDirection(dir)
endfor

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

" Enable mouse. Great for resizing windows and keeping co-workers sane.
 set mouse=a

" Disable swap files.
"set noswapfile

" Write files as they are, don't mess with line endings, etc.
"set binary

" Disable the completion preview window.
"set completeopt-=preview

" make session files minimal.
"set sessionoptions=blank,curdir,folds,help,tabpages,winsize
