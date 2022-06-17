vim.o.compatible = false

local execute = vim.api.nvim_command
local fn = vim.fn
--[[
  For MSWin:
  User Scope Only
    %USERPROFILE% = C:\Users\<username>
    %CSIDL_PROFILE% = C:\Users\<username>
    %CSIDL_LOCAL_APPDATA% = C:\Users\<username>\AppData\Local
  System Scope
    %CSIDL_COMMON_APPDATA% = C:\ProgramData
  Determine what OS we're using, and set paths:
]]--

-- Plugin management via Packer
local errno, _ = pcall(require, 'plugins')
if not errno then
    -- plugins not loaded
    print('Unable to load plugins.lua!')
end

-- Vim mappings, see lua/config/which.lua for more mappings
errno, _ = pcall(require, 'mappings')
if not errno then
    -- plugins not loaded
    print('Unable to load mappings.lua!')
end

-- All non-plugin related options
errno, _ = pcall(require, 'options')
if not errno then
    -- plugins not loaded
    print('Unable to load options.lua!')
end

-- Vim autocommands/autogroups
errno, _ = pcall(require, 'autocmd')
if not errno then
    -- plugins not loaded
    print('Unable to load autocmd.lua!')
end

-- Temporary test setup
vim.cmd([[nnoremap \ :NnnExplorer<cr>]])
