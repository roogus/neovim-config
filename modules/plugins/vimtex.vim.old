let g:vimtex_enabled = 1
let g:vimtex_compiler_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : './build',
  \ 'callback' : 1,
  \ 'continuous' : 1,
  \ 'executable' : 'latexmk',
  \ 'hooks' : [],
  \ 'options' : [
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \   '-shell-escape',
  \ ],
\}

" '_' is the default compiler 
let g:vimtex_compiler_latexmk_engines = {
  \ '_'                : '-lualatex',
  \ 'pdflatex'         : '-pdf',
  \ 'dvipdfex'         : '-pdfdvi',
  \ 'lualatex'         : '-lualatex',
  \ 'xelatex'          : '-xelatex',
  \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
  \ 'context (luatex)' : '-pdf -pdflatex=context',
  \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
\}

let g:vimtex_complete_enabled = 1

" Turn off fancy unicode concealed chars
let g:vimtex_syntax_conceal_default = 0

let g:vimtex_view_enabled = 1
let g:vimtex_view_automatic = 1
let g:vimtex_view_use_temp_files = 1

" mupdf also supported in this config
let g:vimtex_view_method = 'zathura'

" valid for zathura and mupdf view methods only
let g:vimtex_view_forward_search_on_start = 1
