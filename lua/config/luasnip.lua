local ls
local ok

ok, ls = pcall(require, 'luasnip')
if not ok then
    print('Failed to load plugin: luasnip...')
else
    -- Load snippets from friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Configure LuaSnip
    ls.config.set_config({
        history = true, -- keep around last snippet to allow jumping back 
        updateevents = 'TextChanged,TextChangedI', -- update nodes as you type
        enable_autosnippets = true,
        ext_opts = {
            [require('luasnip.util.types').choiceNode] = {
                active = {
                    virt_text = { { '', 'GruvboxOrange'}}
                }
            }
        }
    })

    -- Setup LuaSnip keymaps
    -- Expand the current item or jump to the next item.
    vim.keymap.set({'i', 's'}, '<C-k>', function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, { silent = true })

    -- Jump to the previous item
    vim.keymap.set({'i', 's'}, '<C-j>', function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, { silent = true })

    -- Cycle to next choiceNode
    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, { silent = true })

    -- Cycle to previous choiceNode
    vim.keymap.set({ 'i', 's' }, '<C-h>', function()
        if ls.choice_active() then
            ls.change_choice(-1)
         end
    end, { silent = true })
end

