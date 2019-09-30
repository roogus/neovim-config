" Configur the indent guides on and off.
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"-------------------------------------"
"----------- VIM COMMANDS ------------"
"-------------------------------------"

":IndentGuidesEnable 
"	Enables the indent guides for the current buffer and any other buffer upon
"	entering it.

":IndentGuidesDisable                                      *:IndentGuidesDisable*
"	Disables the indent guides for the current buffer and any other buffer upon
"	entering it.

"-------------------------------------"
"----------- CONFIGURATION -----------"
"-------------------------------------"

" Use this option to control how many indent levels to display guides for.
" Default: 30. Values: integer.

let g:indent_guides_indent_levels = 30

" Use this option to control whether or not the plugin automatically calculates
" the highlight colors. Will use the current colorscheme's background color as a
" base color.
" Default: 1. Values: 0 or 1.

"let g:indent_guides_auto_colors = 1

" If you set this option to 0, be sure to manually define some highlight colors
" in an autocmd.

"  let g:indent_guides_auto_colors = 0
"  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Alternatively you can add the following lines to your colorscheme file.

"
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4

"Use this option to control the percent at which the highlight colors will be
"lightened or darkened.

"Default: 10 (10%). Values: between 0 and 100.

  let g:indent_guides_color_change_percent = 10
 
"Use this option to customize the size of the indent guide. By default the
"value is set to 0, which will set the guide size to be the same as the
"|shiftwidth|. Setting this value to be larger than the |shiftwidth| is essentially
"the same as setting it to 0.

"A common use of this setting is to create skinny indent guides, which look
"great with a |shiftwidth| of 4 or more.

" NOTE: This option only works for soft-tabs (spaces) and not hard-tabs.
" 
" Default: 0. Values: between 0 and |shiftwidth|.
" >
"   let g:indent_guides_guide_size = 1
" <
" 
" ------------------------------------------------------------------------------
"                                                    *'indent_guides_start_level'*
" Use this option to control which indent level to start showing guides from.
" 
" Default: 1. Values: between 1 and g:|indent_guides_indent_levels|.
" >
"   let g:indent_guides_start_level = 2
" <
" 
" ------------------------------------------------------------------------------
"                                                   *'indent_guides_space_guides'*
" Use this option to control whether the plugin considers spaces as indention.
" 
" Default: 1. Values: 0 or 1.
" >
"   let g:indent_guides_space_guides = 0
" <
" 
" ------------------------------------------------------------------------------
"                                                     *'indent_guides_tab_guides'*
" Use this option to control whether the plugin considers tabs as indention.
" 
" Default: 1. Values: 0 or 1.
" >
"   let g:indent_guides_tab_guides = 0
" <
" 
" ------------------------------------------------------------------------------
"                                                   *'indent_guides_soft_pattern'*
" Use this option to explicitly specify a pattern for soft indentation. For
" example to match spaces only in the beginning of line use ' ' pattern.
" 
" Default: '\s'. Values: Vim regexp.
" >
"   let g:indent_guides_soft_pattern = ' '
" <
" 
" ------------------------------------------------------------------------------
"                                          *'indent_guides_enable_on_vim_startup'*
" Use this option to control whether the plugin is enabled on Vim startup.
" 
" Default: 0. Values: 0 or 1.
" >
"   let g:indent_guides_enable_on_vim_startup = 0
" <
" 
" ------------------------------------------------------------------------------
"                                              *'indent_guides_exclude_filetypes'*
" Use this option to specify a list of filetypes to disable the plugin for.
" 
" Default: ['help']. Values: list of strings.
" >
"   let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" <
" 
" ------------------------------------------------------------------------------
"                                                *'indent_guides_default_mapping'*
" Use this option to control whether the default mapping (<Leader>ig) gets set.
" 
" Default: 1. Values: 0 or 1.
" >
"   let g:indent_guides_default_mapping = 0
" <
" 
" ==============================================================================
" 4. MAPPINGS                                             *indent-guides-mappings*
" 
" The default mapping for toggling indent guides is <Leader>ig. You can easily
" map it to other keys. For example:
" >
"   :nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
" <
" 
" You can also map some other commands that are not mapped by default. For
" example:
" >
"   :nmap <silent> <Leader>ie <Plug>IndentGuidesEnable
"   :nmap <silent> <Leader>id <Plug>IndentGuidesDisable
"the indent-guides plugin
