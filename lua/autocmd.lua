--local jdtls_lsp = vim.api.nvim_create_augroup('jdtls_lsp', { clear = true })
--vim.api.nvim_create_autocmd('FileType', {
--    pattern = 'java',
--    callback = function ()
--        vim.schedule(require('jdtls').setup())
--    end,
--    group = jdtls_lsp
--})

