-- Source: https://github.com/neovim/nvim-lspconfig
-- QUIRK: nvim-jdtls requires lsp configuration in ftplugin/java.lua
-- BUG: https://github.com/bash-lsp/bash-language-server/issues/353
--      WRKRND: node <18.0, possible tree-sitter issue.
local nvim_lsp = require('lspconfig');
--local M = {}
--print('Loading lsp.lua...')


local home = os.getenv('HOME');
local bin_dir = home .. '/.local/bin'
local runtime_path = vim.split(package.path, ';');
table.insert(runtime_path, "lua/?.lua");
table.insert(runtime_path, "lua/?/init.lua");
--print('runtime_path: ', runtime_path);
local omnisharp_bin = bin_dir .. '/omnisharp';


--print(lua_cmd)
--print('cmd_path: ', sumneko_binary_path)
--print('cmd_root: ', sumneko_root_path)
--print(vim.api.nvim_get_runtime_file('', true))
--print(vim.fn.expand('$VIMRUNTIME/lua'))
--print(vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'))


--------------------------------------------
---              Handlers                ---
--------------------------------------------
local default_handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { -- Disable virtual_text
            virtual_text = false;
        }
    ),
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' }),
    ['textDocument/signature_help'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
}


--
--------------------------------------------
---            Capabilities              ---
--------------------------------------------
local default_cap = vim.lsp.protocol.make_client_capabilities();
default_cap.workspace.configuration = true;
default_cap.textDocument.completion.completionItem.snippetSupport = true;
default_cap.textDocument.completion.completionItem.resolveSupport = { properties = {
        'documentation',
        'detail',
        'additionalTextEdits'
   };
};


--------------------------------------------
---                Mappings              ---
--------------------------------------------
local function default_maps (bufnr)
    -- Wrapper functions for clarity
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...); end;
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...); end;

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc');

    -- Mappings options
    local opts = { noremap=true, silent=true };

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts);
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts);
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts);
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts);
    buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts);
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts);
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts);
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts);
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts);
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts);
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts);
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts);
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts);
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts);
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts);
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts);
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts);

end


--------------------------------------------
---               on_attach              ---
--------------------------------------------
local default_attach = function(client, bufnr)
    -- Specify formatting for LSP clients as this may be handled by null-ls.
    --client.resolved_capabilities.document_formatting = false
    --client.resolved_capabilities.document_range_formatting = false

    -- Set buffer-local key maps
    default_maps(bufnr)
end



local usr_bin = vim.env.HOME .. '/.local/bin'
local rust_analyzer_cmd = usr_bin .. '/rust-analyzer'
local lua_cmd = vim.env.HOME .. '/src/lua-language-server/bin/lua-language-server'
local sumneko_binary_path = vim.fn.exepath(lua_cmd)
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h')
local texlab_cmd = usr_bin .. '/texlab'

local servers = {
    'bashls',
    'ccls',
    'hls',
    'jsonls',
    'omnisharp',
    'phpactor',
    'pylsp',
    'rust_analyzer',
    'sumneko_lua',
    'texlab',
    'tsserver',
    'vimls',
    'yamlls'
}

local handler_switch = {
    ['bashls'] = default_handlers,
    ['ccls'] = default_handlers,
    ['hls'] = default_handlers,
    ['jdtls'] = {},
    ['jsonls'] = default_handlers,
    ['omnisharp'] = default_handlers,
    ['phpactor'] = default_handlers,
    ['pylsp'] = default_handlers,
    ['rust_analyzer'] = default_handlers,
    ['sumneko_lua'] = default_handlers,
    ['texlab'] = default_handlers,
    ['tsserver'] = default_handlers,
    ['vimls'] = default_handlers,
    ['yamlls'] = default_handlers

}

local attach_switch = {
    ['bashls'] = default_attach,
    ['ccls'] = default_attach,
    ['hls'] = default_attach,
    ['jdtls'] = default_attach,
    ['jsonls'] = default_attach,
    ['omnisharp'] = default_attach,
    ['phpactor'] = default_attach,
    ['pylsp'] = default_attach,
    ['rust_analyzer'] = default_attach,
    ['sumneko_lua'] = default_attach,
    ['texlab'] = default_attach,
    ['tsserver'] = default_attach,
    ['vimls'] = default_attach,
    ['yamlls'] = default_attach
};


local cap_switch = {
    ['bashls'] = default_cap,
    ['ccls'] = default_cap,
    ['hls'] = default_cap,
    ['jdtls'] = default_cap,
    ['jsonls'] = default_cap,
    ['omnisharp'] = default_cap,
    ['phpactor'] = default_cap,
    ['pylsp'] = default_cap,
    ['rust_analyzer'] = default_cap,
    ['sumneko_lua'] = default_cap,
    ['texlab'] = default_cap,
    ['tsserver'] = default_cap,
    ['vimls'] = default_cap,
    ['yamlls'] = default_cap
}

local cmd_switch = {
    ['bashls'] = { bin_dir .. '/bash-language-server', 'start' },
    ['ccls'] = { 'ccls' },
    ['cssls'] = { 'vscode-css-language-server', '--stdio' },
    ['hls'] = { 'haskell-language-server-wrapper', '--lsp' },
    ['html'] = { 'vscode-html-language-server', '--stdio' },
    ['jdtls'] = {},
    ['jsonls'] = { 'vscode-json-language-server', '--stdio' },
    ['omnisharp'] = { -- https://github.com/OmniSharp/omnisharp-roslyn/releases/tag/v1.39.0
        omnisharp_bin,
        '--languageserver',
        '--hostPID',
        tostring(vim.fn.getpid())
    },
    ['phpactor'] = { bin_dir .. '/phpactor', 'language-server' },
    ['pylsp'] = { 'pylsp' },
    ['rust_analyzer'] = { rust_analyzer_cmd },
    ['sumneko_lua'] = {
        sumneko_binary_path,
        '-E',
        sumneko_root_path .. '/main.lua'
    },
    ['texlab'] = { texlab_cmd },
    ['tsserver'] = { 'typescript-language-server', '--stdio' },
    ['vimls'] = { 'vim-language-server', '--stdio' },
    ['yamlls'] = { 'yaml-language-server', '--stdio' }
}

local settings_switch = {
    ['bashls'] = {},
    ['ccls'] = {},
    ['cssls'] = {
        css = {
            vaidate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    },
    ['hls'] = {
        formattingProvider = 'ormolu',
    },
    ['html'] = {},
    ['jdtls'] = {},
    ['jsonls'] = {
        format = { enabled = true },
        schemas = {
            {
                description = 'ESLint config',
                fileMatch = { '.eslintrc.json', '.eslintrc' },
                url = 'https://json.schemastore.org/eslintrc'
            },
            {
                description = 'Package config',
                fileMatch = { 'package.json' },
                url = 'https://json.schemastore.org/package'
            }
        }
    },
    ['omnisharp'] = {},
    ['phpactor'] = {},
    ['pylsp'] = {
        configurationSources = { 'flake8', 'mccabe', 'yapf', 'mypy', 'memestra' },
        plugins = {
            flake8 = {
                config = nil,
                enabled = true,
                exclude = nil,
                executable = '/usr/bin/flake8',
                filename = nil,
                hangClosing = false,
                ignore = nil,
                maxLineLength = 110,
                indentSize = 4,
                perFileIgnores = nil,
                select = nil
            },
            jedi = {
                extra_paths = {},
                env_vars = nil,
                environment = nil,
            },
            jedi_completion = {
                enabled = true,
                include_params = true,
                include_class_objects = true,
                fuzzy = false,
                cache_for = { 'pandas', 'numpy', 'tensorflow', 'matplotlib' }
            },
            jedi_definition = {
                enabled = true,
                follow_imports = true,
                follow_builtin_imports = true
            },
            jedi_symbols = {
                enabled = true,
                all_scopes = true,
                include_import_symbols = true,
            },
            mccabe = {
                enabled = true,
                threshold = 15
            },
            preload = {
                enabled = true,
                modules = nil
            },
            pycodestyle = {
                enabled = false,
                exclude = nil,
                filename = nil,
                select = nil,
                ignore = nil,
                hangClosing = false,
                maxLineLength = 110,
                indentSize = 4
            },
            pydocstyle = {
                enabled = false,
                convention = nil,
                addIgnore = nil,
                addSelect = nil,
                ignore = nil,
                select = nil,
                match = '(?!test_).*\\.py',
                matchDir = '[^\\.].*'
            },
            pyflakes = {
                enabled = true
            },
            pylint = {
                enabled = false,
                args = nil,
                executable = '/usr/bin/pylint'
            },
            rope_completion = {
                enabled = false,
                eager = false
            },
            yapf = {
                enabled = true
            },
            mypy = {
                live_mode = false,
                dmypy = true,
                strict = false,
                overrides = {}
            }
        }
    },
    ['rust_analyzer'] = {},
    ['sumneko_lua'] = {
        runtime = {
            version = 'LuaJIT',
            path = '/usr/share/nvim/runtime/lua/'
        },
        completion = { enable = true, callSnippet = 'Both' },
        diagnostics = {
            enable = true,
            globals = { 'vim' }
        },
        workspace = {
            library = {
                [vim.fn.expand('/usr/share/nvim/runtime/lua')] = true,
                [vim.fn.expand('/usr/share/nvim/runtime/lua/vim/lsp')] = true
            },
            maxPreload = 2047,
            preloadFileSize = 1023
        },
        telemetry = { enable = false }
    },
    ['texlab'] = {
        auxDirectory = './build', -- same as vimtex 'build_dir'?
        bibtexFormatter = 'texlab',
        build = {
            args = {
                '--keep-intermediates',
                '--keep-logs',
                '-outdir=./build',
                '-synctex=1',
                '-lualatex',
                '-interaction=nonstopmode',
                '-shell-escape',
                '%f'
            },
            executable = 'latexmk',
            forwardSearchAfter = true,
            onSave = true,
        },
        chktex = { onEdit = false, onOpenAndSave = true },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = { args = {} },
        latexFormatter = 'texlab',
        latexindent = { modifyLineBreaks = true }
    },
    ['tsserver'] ={},
    ['vimls'] = {},
    ['yamlls'] = {
        telemetry = { enabled = false },
        schemaStore = {
            enable = true,
            url = 'https://www.schemastore.org/api/json/catalog.json',
            -- schemas = { [url] = 'filename' }
            format = { enabled = true },
            validate = true,
            completion = true,
            hover = true
        }
    }
}


local function on_init(client)
  vim.lsp.util.text_document_completion_list_to_complete_items = require('lsp_compl').text_document_completion_list_to_complete_items
  if client.config.settings then
    client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
  end
end


--local function on_exit(client, bufnr)
--  require('me.lsp.ext').detach(client.id, bufnr)
--  vim.cmd('augroup lsp_aucmds')
--  vim.cmd(string.format('au! * <buffer=%d>', bufnr))
--  vim.cmd('augroup end')
--end


--local function mk_config(lsp)
--    return {
--        flags = { debounce_text_changes = 80, allow_incremental_sync = true },
--        handlers = handler_switch[lsp],
--        capabilities = cap_switch[lsp],
--        on_init = on_init,
--        on_attac = attach_switch[lsp],
--        on_exit = {},
--        init_options = {},
--        settings = settings_switch[lsp]
--    }
--end
--M.mk_config = mk_config

--------------------------------------------
---                Setup                 ---
--------------------------------------------
for _, lsp in ipairs(servers) do
    local config = {
        on_attach = attach_switch[lsp],
        capabilities = cap_switch[lsp],
        cmd = cmd_switch[lsp],
        settings = settings_switch[lsp],
        flags = { debounce_text_changes = 80, allow_incremental_sync = true },
        handlers = handler_switch[lsp]
    }

    nvim_lsp[lsp].setup(config)
    require('cmp_nvim_lsp').update_capabilities(cap_switch[lsp])
end



--------------------------------------------
---              Symbols                 ---
--------------------------------------------
vim.fn.sign_define('DiagnosticSignError',
    { text = ' ', texthl = 'DiagnosticSignError' })

vim.fn.sign_define('DiagnosticSignWarn',
    { text = ' ', texthl = 'DiagnosticSignWarn' })

vim.fn.sign_define('DiagnosticSignInfo',
    { text = ' ', texthl = 'DiagnosticSignInfo' })

vim.fn.sign_define('DiagnosticSignHint',
    { text = ' ', texthl = 'DiagnosticSignHint' })

--return M
