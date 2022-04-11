" Set a key mapping to toggle the NERDTree window.
map <C-n> :NERDTreeToggle<CR>

" Show NERDTree if vim is opened without a file arg.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show NERDTree if vim is opened on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Show hidden file by default
"let NERDTreeShowHidden=1

" Set the location of the bookmarks file
"let NERDTreeBookmarksFile=~/.config/nvim/.NERDTreeBookmarks

" Don't collapse dirs with only one child
let NERDTreeCascadeSingleChildDir=0

" Set the display characters
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
