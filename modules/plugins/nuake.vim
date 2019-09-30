" Set the Nuake position:
"   0: horizontal (default), 1: vertical
let g:nuake_position=0

" Set the Nuake size in percent. (0.00-1.00) 0.25 default
let g:nuake_size=0.5

"Enable the Nuake instance per tab page. 0 default
let g:nuake_per_tab=0

"Key-bindings
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
