require('lspkind').init({
    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    --preset = 'codicons',
    preset = 'default',

    -- override preset symbols
    --
    -- default: {}
    --symbol_map = {},
    -- (type: ,,,,爐,,,,,ﮂ,,ﳀ,,ﳄ,,,,,ﲤ,ﲶ,), (method: ﲂ,,), (constructor: ,,,略,,ﰎ,嗢,華,襁,), (interface: ,ﬗ), (variable: ,,) ﯟ,ﳘ,ﳙ,,﬈,
    -- symbol_map = {
    --   Text = "",
    --   Method = "",
    --   Function = "",ﬦ,烈
    --   Constructor = "ﰎ",
    --   Field = "ﰠ",,識,
    --   Variable = "",,
    --   Class = "ﴯ",
    --   Interface = "",ﳧ,ﳦ,ﳥ,
    --   Module = "",
    --   Property = "ﰠ",
    --   Unit = "塞",,塞,,ﮎ,,糖,瑱
    --   Value = "",
    --   Enum = "",了,尿,
    --   Keyword = "",,,
    --   Snippet = "",
    --   Color = "",
    --   File = "",
    --   Reference = "",數,ﱿ
    --   Folder = "",
    --   EnumMember = "",
    --   Constant = "",
    --   Struct = "פּ",
    --   Event = "",
    --   Operator = "",
    --   TypeParameter = ""
    -- },
    symbol_map = {
      Text = "",
      Method = "烈",
      Function = "ﬦ",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "ﳧ",
      Module = "",
      Property = "",
      Unit = "瑱",
      Value = "",
      Enum = "了",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "數",
      Folder = "",
      EnumMember = "了",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },

})
