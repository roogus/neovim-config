vim.opt.list = true
vim.opt.listchars:append("eol:")

require('indent_blankline').setup({
    char = '',
    show_current_context = true,
    show_current_context_start = false,
    show_end_of_line = true,
})
