-- INDENTATION
-- Ensure all numeric values are equal unless you know what
-- you're doing...

-- For hard tabs, comment out `expandtab` & `softtabstop`
-- and uncomment `tabstop`.
--vim.o.tabstop = 4

-- Use spaces instead of tabs
vim.o.expandtab = true
vim.o.softtabstop = 4

-- Set a default indent
vim.o.shiftwidth = 4
-- END INDENTATION

-- APPEARANCE
vim.o.number = true
--vim.o.termguicolors = true
--vim.o.background = 'dark'
--vim.cmd('colorscheme ir_black')
--vim.cmd('colorscheme gruvbox')
--vim.cmd('colorscheme everforest')
--vim.cmd('colorscheme gruvbox-material')
vim.o.pumblend = 20 
-- Doesn't work yet 2022.04.21 @0.7.0
--vim.o.laststatus = 3
-- highlight WinSeparator guibg=None

-- PERFORMANCE
vim.o.ttyfast = true
vim.o.lazyredraw = true

-- SEARCH
vim.o.ignorecase = true
vim.o.smartcase = true

-- SPELLING
vim.o.spelllang = 'en_us'
vim.o.spell = false

-- HIGHLIGHT
vim.o.hlsearch = true
vim.o.cursorline = true

-- WINDOW BEHAVIOR
vim.o.splitbelow = true
vim.o.splitright = true

