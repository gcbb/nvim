local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
    vim.notify("没有找到 indent-blankline")
    return
end


-- require('indentLine').setup{
--     char_list = {'1', '2', '3', '4','5','6','7'}
-- }
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

indent_blankline.setup({
    -- 空行占位
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    show_end_of_line = false,
    space_char_blankline = " ",
    -- 用 treesitter 判断上下文
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = {
        "class",
        "function",
        "method",
        "element",
        "^if",
        "^while",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
    },
    -- echo &filetype
    filetype_exclude = {
        "null-ls-info",
        "dashboard",
        "packer",
        "terminal",
        "help",
        "log",
        "markdown",
        "TelescopePrompt",
        "lsp-installer",
        "lspinfo",
        "toggleterm",
    },
    -- 竖线样式
    -- char = '¦',
    -- char = '┆'
    -- char = '│'
    -- char = "⎸",
    -- char = "▏",

    -- char_list = {'¦', '┆', '⎸', '│','▏'}
    char_list = {'1', '2', '3', '4','5','6','7'}
})

--     -- require('indentLine').setup{
--     --     char_list = {'1', '2', '3', '4','5','6','7'}
--     -- }
--     require("indent_blankline").setup {
--     -- for example, context is off by default, use this to turn it on
--     show_current_context = true,
--     show_current_context_start = true,
-- }
