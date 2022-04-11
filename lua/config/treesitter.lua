-- Source: https://github.com/nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup({
    -- A list of parser names or `all`
    ensure_installed = 'all',
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})
