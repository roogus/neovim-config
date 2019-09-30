" Enable integration SnipMate CSS snippets
" WARNING: breaks other plugins that rely on ft detection
" au BufRead,BufNewFile *.scss set filetype=scss.css

" Enable highlighting function names that start with a keyword
autocmd FileType scss setlocal iskeyword+=-
