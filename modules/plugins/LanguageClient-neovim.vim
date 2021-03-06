set hidden

let g:LanguageClient_loadSettings = 1

if g:os == 'Windows'
  let g:LanguageClient_settingsPath = g:config_root . '\settings.json'
else
  let g:LanguageClient_settingsPath = g:config_root . '/settings.json'
endif

let g:LanguageClient_serverCommands = {
  \ 'php': ['php', '/home/roogus/.config/nvim/plugged/php-language-server/bin/php-language-server.php'],
  \ 'cpp': ['cquery', '--logfile=/tmp/.private/roogus/cquery.log'],
  \ 'c': ['cquery', '--logfile=/tmp/.private/roogus/cquery.log'],
  \ 'vue': ['vls'],
  \ 'javascript': ['node', '/home/roogus/.config/nvim/plugged/javascript-typescript-langserver/lib/language-server-stdio.js'],
  \ 'javascript.jsx': ['node', '/home/roogus/.config/nvim/plugged/javascript-typescript-langserver/lib/language-server-stdio.js']
  \ }

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <F5> :LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
