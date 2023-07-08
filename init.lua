vim.g.python3_host_prog = vim.fn.exepath('python.exe')
-- print("reload init lua")

require("basic")
require('plugins')

require("config")

require("utils.global")
require("keybindings")
require('colorscheme')
require("codegpt.config")

require('plugin-config.nvim-treesitter')
require('plugin-config.comment')

require('plugin-config.targbar')
require('plugin-config.indent-blankline')
-- require('plugin-config.coc')
require("plugin-config.telescope")
-- require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-tree")

require("plugin-config.debuger")
require("plugin-config.lualine")
require("plugin-config.toggleterm")
-- require("plugin-config.fidget")
-- 内置LSP

-- require("lsp")
--      require("dap")
--
require("lsp.setup")
require("cmp")
-- require("lsp.ui")
--
-- 格式化
-- require("lsp.formatter")
-- require("lsp.null-ls")
require('leap').add_default_mappings()
require("mason").setup()
require("lsp.config.snippets")

-- require("ultisnips").setup()
-- require("bufferline").setup{}
