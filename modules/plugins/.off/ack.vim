" Use ag (The Silver Searcher) as a replacement for ack, if it exists...
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
