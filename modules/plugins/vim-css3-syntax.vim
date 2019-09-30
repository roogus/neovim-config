" Correct highlighting artifacts
autocmd FileType css setlocal iskeyword+=-

" Highlight vendor prefixes
:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
