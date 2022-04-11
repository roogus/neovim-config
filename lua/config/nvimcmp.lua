local ok
local luasnip
local lspkind
local cmp

ok, luasnip = pcall(require, 'luasnip')
if not ok then
    print('Failed to load plugin: luasnip...')
end

ok, lspkind = pcall(require, 'lspkind')
if not ok then
    print('Failed to load plugin: lspkind...')
end

ok, cmp = pcall(require, 'cmp')
if not ok then
    print('Failed to load plugin: cmp...')
    return
end

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,col):match('%s') == nil
end

cmp.setup({
    enabled = function()
        return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
            or require('cmp_dap').is_dap_buffer()
    end,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
        --completion = cmp.config.window.bordered(),
        --documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<c-space>'] = cmp.mapping.complete(),
        ['<c-y>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })
    }),
    sources = cmp.config.sources({
        { name = 'dap' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        -- { name = 'cmdline' },
        { name = 'buffer', keyword_length = 5, max_item_count = 5 },
    }),
    formatting = {
        format = lspkind.cmp_format {
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[api]',
                path = '[path]',
                luasnip = '[snip]'
            }
        }
    },
    experimental = {
        native_menu = false,
        ghost_text = true
    }
})
