local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end


vim.g.mapleader = " "
vim.g.maplocalleader = ","

imap('jk', '<esc>') -- easy ESC

-- Copy to Clipboard
vmap('<leader>y', '"+y')
nmap('<leader>Y', '"+yg_')
nmap('<leader>y', '"+y')
nmap('<leader>yy', '"+yy')

-- Paste from Clipboard
nmap('<leader>p', '"+p')
nmap('<leader>P', '"+P')
vmap('<leader>p', '"+p')
vmap('<leader>P', '"+P')

-- Window Navigation
nmap('<C-h>', '<C-w>h') -- left
nmap('<C-l>', '<C-w>l') -- right
nmap('<C-j>', '<C-w>j') -- down
nmap('<C-k>', '<C-w>k') -- up

-- Telescope.nvim
nmap('<leader>f', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope git_files<cr>')
nmap('<leader>gs', '<cmd>Telescope grep_string<cr>')
nmap('<leader>gl', '<cmd>Telescope live_grep<cr>')
nmap('<leader>lg', '<cmd>LazyGit<cr>')
