" Plugin key mappings
" NOTE: It must be "imap" and "smap". It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab-like snippets behavior
" NOTE: It must be "imap" and "smap". It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>":
" \ neosnippet#expandable_or_jumpable() ?
" \   "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable SnipMate compatibility
"let g:neosnippet#enable_snipmate_compatibility=1

" Tell neosnippet about other snippets
"let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'