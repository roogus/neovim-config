"" Enable ALE plugin
"let g:ale_enabled = 1
"
"" Enable airline integration
"let g:airline#extensions#ale#enabled = 1
"
"" Turn on completion (moved to modules/ale.vim)
let g:ale_completion_enabled = 0
"
"" Use balloon_show() func to display Hover info
"let g:ale_set_balloons = 1
"
"" Enable specific linters per filetype
""\  'php': ['langserver'],
"let g:ale_linters={
"\  'sh': ['shell'],
"\  'c': ['cquery'],
"\  'cpp': ['cquery'],
"\  'text': [],
"\}
"
"" Enable finters
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'c': ['clang-format'],
"\   'cpp': ['clang-format'],
"\}
"
"" Set this variable to 1 to fix files when you save them.
"let g:ale_fix_on_save = 1
"
"" PHP settings
""let g:ale_php_php_executable = 'php'
""let g:ale_php_langserver_use_global = 1
""let g:ale_php_langserver_executable = ' /home/roogus/.config/nvim/plugged/php-language-server/bin/php-language-server.php'
