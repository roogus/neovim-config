require('zenbones')

--local _theme = 'zenbones'
--local _theme = 'forestbones'
local _theme = 'zenwritten'

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd('colorscheme ' .. _theme)
