require('lualine').setup {
    options = {
        icons_enabled = true,
        --theme = 'gruvbox',
        --theme = 'everforest',
        --theme = 'gruvbox-material',
        --theme = 'kanagawa',
        --theme = 'zenbones',
        --theme = 'forestbones',
        theme = 'zenwritten',
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {'neo-tree'}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'b:gitsigns_head', icon = ''}, 'diff'},
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1,
                shorting_target = 40,
                symbols = { modified = '[]', readonly = '' }
            }
        },
        lualine_x = {
            {'diagnostics',
                sources = { 'nvim_diagnostic' }
            },
            'encoding',
            'fileformat',
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
