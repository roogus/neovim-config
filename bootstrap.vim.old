" Make Vim more usefull. This should always be your first configuration line.
set nocompatible

" wraps paths to make them relative to this directory.
function! Dot(path)
  return g:config_root . a:path
endfunction

" Load all configuration modules.
" Some plugins require options to be set prior to load, (...ALE...),
" so some plugin.vim files will appear here too.
if g:os == 'Windows'
  for file in split(glob(Dot('\modules\*.vim')), '\n')
    if g:dbg == 'true'
      echom "[INFO] Sourcing file: " . file
    endif
    execute 'source' file
  endfor
else
  for file in split(glob(Dot('/modules/*.vim')), '\n')
    if g:dbg == 'true'
      echom "[INFO] Sourcing file: " . file
    endif
    execute 'source' file
  endfor
endif

" Load all discrete configuration modules for specific plugins
" Die early if this Vim install is built with tiny or small.
" We don't want a Raspberry Pi, for example, running all of these.
if !1 | finish | endif

" Initialize vim-plug
call plug#begin(g:vimplug_dir)

" Load plugin list for vim-plug to manage.
if g:os == 'Windows'
  if g:dbg == 'true'
    echom "[INFO] Loading plugins from: " . Dot('\plugins.vim')
  endif
  execute 'source ' Dot('\plugins.vim')
else
  if g:dbg == 'true'
    echom "[INFO] Loading plugins from : " . Dot('/plugins.vim') . "..."
  endif
  execute 'source ' Dot('/plugins.vim')
endif

" Lock in the plugin list.
call plug#end()

" Load all plugin configuration files.
if g:os == 'Windows'
  for file in split(glob(Dot('\modules\plugins\*.vim')), '\n')
    if g:dbg == 'true'
      echom "[INFO] Sourcing file: " . file
    endif
    execute 'source' file
  endfor
else
  for file in split(glob(Dot('/modules/plugins/*.vim')), '\n')
    if g:dbg == 'true'
      echom "[INFO] Sourcing file: " . file
    endif
    execute 'source' file
  endfor
endif
