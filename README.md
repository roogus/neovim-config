# Neovim 0.7 Config


### Introduction

A Neovim config for linux environments featuring:
    - [nvim-lspconfig]()
        Configured for:
            - [ccls](https://github.com/MaskRay/ccls) {C/C++}
            - [python-lsp-server](https://github.com/python-lsp/python-lsp-server) {Python} (with mypy and yapf)
            - [jdtls](https://github.com/eclipse/eclipse.jdt.ls) and [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) {Java}
            - [omnisharp](https://github.com/OmniSharp/omnisharp-roslyn) {C#}
            - [haskell-language-server](https://github.com/haskell/haskell-language-server) {Haskell}
            - [sumneko](https://github.com/sumneko/lua-language-server) {Lua}
            - [gopls]() {Go}
            - [rust-analyzer]() {Rust}
    - [tree-sitter](https://github.com/tree-sitter/tree-sitter) and [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    - [nvim-dap](https://github.com/mfussenegger/nvim-dap)
        Configured for:
            - C/C++/Rust via [codelldb](https://github.com/vadimcn/vscode-lldb) (wip)
            - Python via [debugpy]() and [nvim-dap-python]() (wip)
            - Java via [java-debug]() and [nvim-jdtls]() (wip)
            - Go via and [delve]() (wip)
            - Javascript Firefox [vscode-firefox-debug]() (TODO)
            - C# via [netcoredbg]() (TODO)
            - PHP via [vscode-php-debug]() (TODO)
    - [zenbones.nvim](https://github.com/mcchrish/zenbones.nvim)
    - [Lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    - [nnn.nvim](https://github.com/luukvbaal/nnn.nvim) (TODO)

Alongside many other useful plugins.

### Setup

    Dependencies: TODO

### Usage

    TODO

### Licensing

All content in the `lua/` directory as well as the `ftplugin/java.lua` and `init.lua` files is released under the MIT license.

All content within the `syntax/`, `ftplugin/`, and `colors/` directories are subject to the terms outlined in each individual file, where present. If there are license or copyright problems involving these files please submit an Issue.
