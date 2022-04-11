-- Settings for everforest.nvim
-- https://github.com/sainnhe/everforest

vim.g.everforest_enable_italic = 1
vim.g.everforest_disable_italic_comment = 1
vim.g.everforest_cursor = 'purple'
vim.g.everforest_transparent_background = 0
vim.g.everforest_sign_column_background = 'none'
vim.g.everforest_spell_foreground = 'none'
vim.g.everforest_ui_contrasts = 'high'
vim.g.everforest_show_eob = 1
vim.g.everforest_diagnostic_text_highlight = 0
vim.g.everforest_diagnostic_line_highlight = 0
vim.g.everforest_diagnostic_virtual_text = 'colored'
vim.g.everforest_current_word = 'grey background'
vim.g.everforest_disable_terminal_colors = 0
vim.g.everforest_lightline_disable_bold = 0
vim.g.everforest_better_performance = 0

if vim.g.pick_colors.name == 'everforest' then
    -- Set terminal color range.
    vim.o.termguicolors = true -- truecolor needed for all variations of this scheme

    if vim.g.pick_colors.type == 'dark' then
        vim.o.background = 'dark'
    elseif vim.g.pick_colors.type == 'light' then 
        vim.o.background = 'light'
    else
        print('Could not set background to: ', vim.g.pick_colors.type)
        return
    end

    if vim.g.pick_colors.contrast == 'hard' then
        vim.g.everforest_background = 'hard'
    elseif vim.g.pick_colors.contrast == 'med' then
        vim.g.everforest_background = 'medium'
    elseif vim.g.pick_colors.contrast == 'soft' then
        vim.g.everforest_background = 'soft'
    else
        print('Could not set contrast to: ', vim.g.pick_colors.contrast)
        return
    end

    vim.cmd('colorscheme ' .. vim.g.pick_colors.name)
end
