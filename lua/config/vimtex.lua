vim.g.vimtex_enabled = 1
vim.g.vimtex_compiler_enabled = 1
-- vim.g.vimtex_compiler_progname = 'nvr' -- deprecated as of 2021.20.25
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    build_dir = './build',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    hooks = {},
    options = {
        '-outdir=./build',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape'
    }
}
vim.g.vimtex_compiler_latexmk_engines = {
    _ = '-lualatex',
    pdflatex = '-pdf',
    dvipdfex = '-pdfdvi',
    lualatex = '-lualatex',
    xelatex = '-xeltex',
    context_pdftex = '-pdf -pdflatex=texexec',
    context_luatex = '-pdf -pdflatex=context',
    context_xetex = '-pdf -pdflatex=\'texexec --xtx\''
}
vim.g.vimtex_complete_enabled = 1 -- enable if texlab not in use
vim.g.vimtex_syntax_conceal_disable = 1 -- disable fancy unicode chars replacing '\something'
-- vim.g.vimtex_syntax_conceal = {
--     accents = 0,
--     cites = 0,
--     fancy = 0,
--     greek = 0,
--     math_bounds = 0,
--     math_delimiters = 0,
--     math_fracs = 0,
--     math_super_sub = 0,
--     math_symbols = 0,
--     sections = 0,
--     styles = 0
-- }
-- vim.g.vimtex_syntax_conceal_sites = {
--     type = 'brackets', -- 'brackets' || 'icon'
--     icon = 'fancy_icon', -- only used if type = 'icon'
--     verbose = true -- lua equivalent of `v:true`??
-- }
vim.g.vimtex_view_enabled = 1
vim.g.vimtex_view_automatic = 1
vim.g.vimtex_view_use_temp_files = 1
vim.g.vimtex_view_method = 'zathura' -- also supports mupdf in this particular configuration
vim.g.vimtex_view_forward_search_on_start = 1
