local trouble = require('trouble.providers.telescope')
require('telescope').setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        layout_strategy = 'flex',
        layout_config = {
            flex = {
                flip_columns = 120, -- default: 100 columns
                preview_cutoff = 120 -- default: 120 cols horizontal
            }
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
                ['<C-t>'] = trouble.open_with_trouble
            },
            n = {
                ['<C-t>'] = trouble.open_with_trouble
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker

        symbols = {
            sources = {
                'emoji',
                'gitmoji',
                --'julia',
                --'kaomoji',
                'latex',
                'math',
                'nerd'
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true
        },
        file_browser = {
            theme = 'ivy',
            -- mappings = {
            --     ['i'] = {}
            --     ['n'] = {}
            -- }
        }
    }
})

-- Initialize Extensions
require('telescope').load_extension('ui-select')
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('lazygit')
require('telescope').load_extension('dap')
