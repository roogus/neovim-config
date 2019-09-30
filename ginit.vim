if exists('g:GtkGuiLoaded') != 0
  call rpcnotify(1, 'Gui', 'Font', 'FuraCode Nerd Font Regular 10')
else
  if has("gui_running")
      if g:os == "Darwin"
	Guifont! FuraMono NF:h10
        set guifont=Fira\ Mono:h12
      elseif g:os == "Linux"
	Guifont! FuraMono NF:h10
        set guifont=Fira\ Mono\ 10
      elseif g:os == "Windows"
	Guifont! FuraMono NF:h10
        set guifont=Fira_Mono:h12:cANSI
      endif
  endif
endif
