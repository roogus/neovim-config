vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_floating_window_window_corner_chars = { '╭', '╮', '╰', '╯' }
vim.g.lazygit_floating_window_use_plenary = 0
vim.g.lazygit_use_neovim_remote = 0

local lg = vim.api.nvim_create_augroup('lazygit', { clear = true })
vim.api.nvim_create_autocmd(
    'BufEnter', 
    { 
        callback = function ()
            require('lazygit.utils').project_root_dir()
        end,
        group = lg
    })
