--print('Entering plugins.lua...')
local execute = vim.api.nvim_command
local fn = vim.fn
local on_windows = vim.loop.os_uname().version:match 'Windows'
--vim.g.pick_colors = {
--    -- Name of config file containing scheme-specific setup.
--    name = 'kanagawa',
--    type = 'dark', -- XOR('dark','light')
--    contrast = 'hard', -- XOR('hard','med','soft')
--    opts = {} -- Miscellaneous extra options passed in a table.
--}

-- E.g. *fox schemes would look like:
--vim.g.pick_colors = {
--    name = 'nightfox',
--    type = 'dark',
--    contrast = nil,
--    opts = nil
--}
-- and the scheme would be built with `name .. type`

local function join_paths(...)
  local path_sep = on_windows and '\\' or '/'
  local result = table.concat({ ... }, path_sep)
  return result
end

local data_dir = fn.stdpath('data')
--vim.cmd('set packpath=' .. join_paths(data_dir, 'site', 'pack'))

local package_root = join_paths(data_dir, 'site', 'pack')
local install_path = join_paths(package_root, 'packer', 'start', 'packer.nvim')
--local compile_path = join_paths(install_path, 'plugin', 'packer_compiled.lua')

-- Returns the require for use in `config` parameter of packer's `use`.
-- Expects the name of the config file.
-- NOTE: pcall(require, "name") allows the script to keep running
-- even if the require("name") fails to load.
local function get_config(name)
    local path = join_paths('config', name)
    return string.format('require("%s")', path)
end

--print('Checking for bootstrap...')
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
    --print('Installing Packer...')
    packer_bootstrap = fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    --print('Activating Packer...')
    execute 'packadd packer.nvim'
end

local packer = require('packer')
--print('Initializing Packer...')
packer.init({})
local use = packer.use
--print('Resetting Packer...')
packer.reset()

--print('Loading Packer plugins...')
-- Plugin List
use { 'wbthomason/packer.nvim' }
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = get_config('treesitter') }
use { 'nvim-treesitter/nvim-treesitter-textobjects',
    requires = { 'nvim-treesitter/nvim-treesitter' }
}

use { 'rafamadriz/friendly-snippets' }
use { 'molleweide/LuaSnip-snippets.nvim' }
use { 'L3MON4D3/LuaSnip',
    requires = {
        'rafamadriz/friendly-snippets',
        'molleweide/LuaSnip-snippets.nvim'
    },
    config = get_config('luasnip')
}
use { 'saadparwaiz1/cmp_luasnip', requires = 'L3MON4D3/LuaSnip' }
use { 'mfussenegger/nvim-dap' }
use { 'theHamsta/nvim-dap-virtual-text',
    requires = {
        'mfussenegger/nvim-dap',
        'nvim-treesitter/nvim-treesitter'
    },
    config = get_config('dap-virt-text')
}
use { 'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' },
    config = get_config('dap-ui')
}
use { 'mfussenegger/nvim-dap-python',
    requires = {
        'nvim-treesitter/nvim-treesitter',
        'mfussenegger/nvim-dap'
    },
    config = get_config('dap-python')
}
use { 'leoluz/nvim-dap-go',
    requires = { 'mfussenegger/nvim-dap' },
    config = get_config('dap-go')
}
use { 'simrat39/rust-tools.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = get_config('rust-tools')
}
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-nvim-lua' }
use { 'hrsh7th/cmp-buffer' }
use { 'hrsh7th/cmp-path' }
use { 'hrsh7th/cmp-cmdline' }
use { 'onsails/lspkind.nvim', config = get_config('lspkinds') }
use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
use { 'kdheepak/cmp-latex-symbols' }
use { 'rcarriga/cmp-dap', requires = 'mfussenegger/nvim-dap' }
use { 'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'kdheepak/cmp-latex-symbols',
        'onsails/lspkind.nvim',
        'rcarriga/cmp-dap'
    },
    config = get_config('nvimcmp')
}
use { 'mfussenegger/nvim-jdtls' }
use { 'neovim/nvim-lspconfig', config = get_config('lsp'), requires = { 'mfussenegger/nvim-jdtls' } }
use { 'mcchrish/zenbones.nvim', config = get_config('zenbones'), requires = { 'rktjmp/lush.nvim' } }
use { 'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    requires = {
        'kyazdani42/nvim-web-devicons',
        'ellisonleao/gruvbox.nvim',
        'sainnhe/everforest',
        'sainnhe/gruvbox-material',
        'rebelot/kanagawa.nvim'
    },
    config = get_config('lualine')
}
use { 'luukvbaal/nnn.nvim', config = get_config('nnn') }
use { 'windwp/nvim-autopairs', config = get_config('autopairs') }
use { 'lukas-reineke/indent-blankline.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = get_config('indent-blankline')
}
use { 'lewis6991/gitsigns.nvim', tag = 'release', config = get_config('gitsigns-nvim') }
use { 'numToStr/Comment.nvim',
    requires = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'rafamadriz/friendly-snippets',
        'molleweide/LuaSnip-snippets.nvim'
    },
    config = get_config('comment')
}
use { 'RRethy/nvim-treesitter-textsubjects',
    requires = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = get_config('textsubjects')
}
use { 'folke/trouble.nvim', config = get_config('trouble') }
use { 'kdheepak/lazygit.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = get_config('lazygit')
}
use { 'nvim-telescope/telescope-dap.nvim',
    requires = {
        'nvim-treesitter/nvim-treesitter',
        'mfussenegger/nvim-dap',
    }
}
use { 'nvim-telescope/telescope-ui-select.nvim' }
use { 'nvim-telescope/telescope-symbols.nvim' }
use { 'nvim-telescope/telescope-fzy-native.nvim' }
use { 'nvim-telescope/telescope-file-browser.nvim' }
use { 'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter',
        'kdheepak/lazygit.nvim',
        'nvim-telescope/telescope-symbols.nvim',
        'nvim-telescope/telescope-fzy-native.nvim',
        'nvim-telescope/telescope-dap.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = get_config('telescope-nvim')
}
use { 'numToStr/FTerm.nvim', config = get_config('fterm') }
use { 'tpope/vim-surround' }
use { 'lervag/vimtex', config = get_config('vimtex') }
use { 'andy-morris/alex.vim'}
use { 'andy-morris/happy.vim'}
use { 'ggandor/leap.nvim', config = get_config('leap') }
use { 'RRethy/nvim-base16', config = get_config('nvim-base16') }

if packer_bootstrap then
    --print('Syncing Packer plugins...')
    require('packer').sync()
end
