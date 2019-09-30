" CtrlP Plugin Configuration
" https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rac'
let g:ctrlp_root_markers = ['pom.xml', 'courseleaf.cfg']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
let g:ctrlp_show_hidden = 1

" For caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = '/home/roogus/.cache/ctrlp'
"let g:ctrlp_map = ',,'
"let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.*~,*zip,*.tar*,*.7z,*.class,*.bkp,*.bak
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](attic|archive|[0-9])*(\.(git|hg|svn))*$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'some_bad_symbolic_links',
	\ }

if executable( 'ag' )
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore .git --ignore .svn --ignore .DS_Store -g ""'
endif

" CtrlP CMatcher Configuration
" https://github.com/JazzCore/ctrlp-cmatcher
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

