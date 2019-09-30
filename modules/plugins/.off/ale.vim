" ALE Plugin Configuration 
" https://github.com/w0rp/ale

"================================
"   Toggle the 'On' Switch
let g:ale_enabled = 1

"================================
" Toggle vim-airline Integration TODO - var doesn't exist
"let g:airline#extensions#ale#enabled

"================================
"   ALE Linting Timing Opts
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_delay = '200' " in milliseconds
" run the following cmd to manually lint the current buffer
" :ALELint

"================================
"   ALE Linting Msg Loc Opts
" By updating loclist. (On by default)
let g:ale_set_loclist = 1
" By updating quickfix. (Off by default)
let g:ale_set_quickfix = 0
" By setting error highlights.
let g:ale_set_highlights = 1
" By creating signs in the sign column.
let g:ale_set_signs = 1
" By echoing messages based on your cursor.
let g:ale_echo_cursor = 1
" By showing balloons for your mouse cursor.
let g:ale_set_balloons = 1

"================================
" ALE Available Linters
let g:ale_linters = {
        \ 'vim': ['vint'],
        \ 'sh': ['langserver'],
        \ 'csh': ['langserver'],
        \ 'zsh': ['langserver'],
        \ 'xml': ['xmllint'],
        \ 'html': ['proselint'],
        \ 'yaml': ['yamllint'],
        \ 'javascript': ['eslint'],
        \ 'json': ['jsonlint']
\ }

"================================
" ESLint Specific Opts
"let g:ale_javascript_eslint_executable = 'special-eslint'
let g:ale_javascript_eslint_use_global = 1

"================================
"   ALE Filetype Aliases
let g:ale_linter_aliases = {
        \ 'html': ['html', 'javascript', 'css'],
        \ 'atj': ['atj', 'html'],
        \ 'xml': ['xml', 'html']
        \ }

"================================
"   TODO Auto-Fix, Auto-Complete, LanguageServers
