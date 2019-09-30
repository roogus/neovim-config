let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_path_to_python_interpreter='/usr/bin/python3'

let g:ycm_autoclose_preview_window_after_insertion = 1

nnoremap gd         :YcmCompleter GoToDefinition<CR>
nnoremap gr         :YcmCompleter GoToReferences<CR>
"nnoremap <leader>fv :YcmCompleter RefactorRename
nnoremap <leader>rs :YcmCompleter RestartServer<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
"let g:ycm_rust_src_path = '/home/roogus/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/doc/rust/html/src/'
let g:ycm_rust_src_path = '/usr/share/rust-1.16.0/src/'

