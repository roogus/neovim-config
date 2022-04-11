local jdtls = require('jdtls')
local root_markers = {'gradlew', '.git', 'mvnw', 'pom.xml'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local jdtls_jar = vim.fn.glob(home .. '/src/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar')
local jdtls_config = home .. '/src/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux'
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
--local config = require('config.lsp').mk_config('jdtls')

local function on_init(client)
  lsp.util.text_document_completion_list_to_complete_items = require('lsp_compl').text_document_completion_list_to_complete_items
  if client.config.settings then
    client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
  end
end


local caps = vim.lsp.protocol.make_client_capabilities();
caps.workspace.configuration = true;
caps.textDocument.completion.completionItem.snippetSupport = true;
caps.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits'
   };
};


local default_maps = function(bufnr)
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


local cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_jar,
    '-configuration', jdtls_config,
    '-data', workspace_folder
}

local settings = {
    java = {
        import = {
            gradle = { enabled = true },
            maven = { enabled = true },
            exclusions = {
                '**/node_modules/**',
                '**/.metadata/**',
                '**/archetype-resources/**',
                '**/META-INF/maven/**',
                '/**/test/**'
            }
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = 'fernflower' },
        completion = {
            favoriteStaticMembers = {
                'org.hamcrest.MatcherAssert.assertThat',
                'org.hamcrest.Matchers.*',
                'org.hamcrest.CoreMatchers.*',
                'org.junit.jupiter.api.Assertions.*',
                'java.util.Objects.requireNonNull',
                'java.util.Objects.requireNonNullElse',
                'org.mockito.Mockito.*'
            },
            filteredTypes = {
                'com.sun.*',
                'io.micrometer.shaded.*',
                'java.awt.*',
                'jdk.*',
                'sun.*'
            },
            importOrder = {
                { 'java', 'javax', 'com', 'org' }
            }
        },
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            }
        },
        codeGeneration = {
            toString = {
                template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}'
            },
            hashCodeEquals = {
                useJava7Objects = true
            },
            useBlocks = true
        },
        configuration = {
            runtimes = {
                { name = 'JavaSE-1.8',
                    path = '/usr/lib64/openjdk-8/'
                },
                {
                    name = 'JavaSE-11',
                    path = '/usr/lib64/openjdk-11/'
                },
                {
                    name = 'JavaSE-17',
                    path = '/usr/lib64/openjdk-17/'
                }
            }
        }
    }
}

local on_attach = function(client, bufnr)
     -- Wrapper functions for clarity
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...); end;
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...); end;
    local opts = { silent = true, buffer = bufnr }

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc');

    default_maps(bufnr)

    -- Setup Dap 
    jdtls.setup_dap({hotcodereplace = 'auto'})
    jdtls.setup.add_commands()
    buf_set_keymap('n', "<leader>df", 'jdtls.test_class', opts)
    buf_set_keymap('n', "<leader>dn", 'jdtls.test_nearest_method', opts)

    buf_set_keymap('n', "<A-o>", '<cmd>lua require("jdtls").organize_imports()<cr>', opts)
    buf_set_keymap('n', "crv", '<cmd>lua require("jdtls").extract_variable()<cr>', opts)
    buf_set_keymap('v', "crv", '<esc><cmd>lua require("jdtls").extract_variable(true)<cr>', opts)
    buf_set_keymap('n', "crc", '<cmd>lua require("jdtls").extract_constant()<cr>', opts)
    buf_set_keymap('v', "crc", '<esc><cmd>lua require("jdtls").extract_constant(true)<cr>', opts)
    buf_set_keymap('v', 'crm', '<esc><cmd>lua require("jdtls").extract_method(true)<cr>', opts)

    --local create_command = vim.api.nvim_buf_create_user_command
    --create_command(bufnr, 'W', require('me.lsp.ext').remove_unused_imports, {
    --  nargs = 0,
    --})
end

local config = {
    flags = {
        debounce_text_changes = 80,
        allow_incremental_sync = true
    },
    handlers = {},
    capabilities = caps,
    on_init = on_init;
    on_attach = on_attach;
    on_exit = function() end;
    init_options = {},
    settings = settings,
    cmd = cmd
}


-- This setup adapted from: https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L1-L149
-- Java DAP Quick Start (tested on linux@openjdk-11):
--   Manually install and compile necessary dependencies:
-- 1) java-debug:
--      $ git clone https://github.com/microsoft/java-debug
--      $ cd <src_dir>/java-debug ; ./mvnw clean verify
-- 2) VSCode Java Test Plugin:
--      $ git clone https://github.com/microsoft/vscode-java-test
--      $ cd <src_dir>/vscode-java-test/java-extension ; ./mvnw clean verify
-- 3) VSCode Java Decompiler Plugin:
--      $ git clone https://github.com/dgileadi/vscode-java-decompiler
local jar_patterns = {
  '/src/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
  '/src/vscode-java-decompiler/server/*.jar',
  '/src/vscode-java-test/java-extension/com.microsoft.java.test.plugin/target/com.microsoft.java.test.plugin-*.jar',
  '/src/vscode-java-test/java-extension/com.microsoft.java.test.runner/target/*.jar'
};

local plugin_path = '/src/vscode-java-test/java-extension/com.microsoft.java.test.plugin.site/target/repository/plugins/'
local bundle_list = vim.tbl_map(
  function(x) return require('jdtls.path').join(plugin_path, x) end,
  {
    'org.eclipse.jdt.junit4.runtime_*.jar',
    'org.eclipse.jdt.junit5.runtime_*.jar',
    'org.junit.jupiter.api*.jar',
    'org.junit.jupiter.engine*.jar',
    'org.junit.jupiter.migrationsupport*.jar',
    'org.junit.jupiter.params*.jar',
    'org.junit.vintage.engine*.jar',
    'org.opentest4j*.jar',
    'org.junit.platform.commons*.jar',
    'org.junit.platform.engine*.jar',
    'org.junit.platform.launcher*.jar',
    'org.junit.platform.runner*.jar',
    'org.junit.platform.suite.api*.jar',
    'org.apiguardian*.jar'
  }
);

-- Append bundle_list onto jar_patterns
vim.list_extend(jar_patterns, bundle_list)


-- Create final table of bundles to pass into config.init_options
local bundles = {}
for _, jar_pattern in ipairs(jar_patterns) do
  for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
    if not vim.endswith(bundle, 'com.microsoft.java.test.runner-jar-with-dependencies.jar')
      and not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
      table.insert(bundles, bundle)
    end
  end
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities;
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true;

config.init_options = {
  bundles = bundles;
  extendedClientCapabilities = extendedClientCapabilities;
}

-- mute; having progress reports is enough
config.handlers['language/status'] = function() end;
config.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false;
    }
);
config.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' });
config.handlers['textDocument/signature_help'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' });


jdtls.start_or_attach(config)
