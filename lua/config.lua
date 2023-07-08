vim.o.foldmethod = "indent"

-- 创建快捷键映射
-- vim.api.nvim_set_keymap('n', 'pd', ':lua insertStringAfterVariable()<CR>', { noremap = true })
-- 定义自定义函数 InserDebugMsg
-- vim.cmd([[
--   function! insertStringAfterVariable(mode)
--       if a:mode != "json"
--           execute "normal! viwyoLogger.debug(''"
--           execute "normal! pa='+str(''"
--           execute "normal! pa))"
--       else
--           execute "normal! viwyoLogger.debug(''"
--           execute "normal! pa='+json.dumps(''"
--           execute "normal! pa,indent = 4))"
--       endif
--   endfunction
-- ]])

-- 定义自定义函数 InserDebugJsonMsg
vim.cmd([[
  function! SetBreakPoint()
  execute "normal Iimport ipdb as pdb;pdb.set_trace()"
  endfunction
]])

-- 创建快捷键映射
-- vim.api.nvim_set_keymap('n', ',rf', ':lua run_file()<CR>', { noremap = true })

vim.cmd([[
  function! RunFile_old(mode)
  exec "w"
  if &filetype == 'python' then
  if a:mode == "test" then
  let test_file_dir = join(['Test_', expand('%')], '')
  if ! filereadable(test_file_dir) then
  let test_file_dir = join(['test/test_', expand('%')], '')
  endif
  echo test_file_dir
  exec ':H python ' . test_file_dir
  elseif a:mode == "main" then
  if filereadable("main_.py") then
  exec ':H python main_.py'
  endif
  else
  exec ':H python ' . expand('%')
  endif
  elseif &filetype == 'dosbatch' then
  exec ':H ./' . expand('%')
  elseif &filetype == 'markdown' then
  exec ':MarkdownPreviewToggle'
  endif
  endfunction
]])


-- 定义Pep8函数
function Pep8()
  vim.cmd("w")
  if vim.bo.filetype == 'python' then
    vim.fn.system("!black %")
    -- vim.fn.system("!pycodestyle --first %")
    -- vim.fn.system("!flake8 %")
  end
end

-- 检查 cfg.vim 文件是否可读并加载
if vim.fn.filereadable("cfg.vim") then
  -- TODO filereadable 不能正常返回值
  -- vim.cmd("source cfg.vim")
end

-- 定义构建 Quickfix 列表的函数
function build_quickfix_list(lines)
  vim.fn.setqflist(vim.tbl_map(function(line) return { filename = line } end, lines))
  vim.cmd("copen")
  vim.cmd("cc")
end

-- 自动命令：在 BufReadPost 事件中触发
vim.cmd("autocmd BufReadPost *.json")

-- 设置编码
vim.o.encoding = "utf-8"
-- 设置 json 文件显示引号
vim.o.conceallevel = 0

-- 定义 ShowDocumentation 函数
function ShowDocumentation()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_feedkeys('K', 'in', false)
  end
end




--  vim -snippets
-- 设置 snippets 路径为配置文件路径下的 /snip 目录
local config_dir = vim.fn.stdpath("config")
local snippets_dir = config_dir .. "/snip"
vim.g.vsnip_snippet_dir = snippets_dir
vim.g.UltiSnipsSnippetDirectories={snippets_dir}
vim.g.UltiSnipsExpandTrigger="<S-tab>"
---------------
local UserConfig = {

  colorscheme = "tokyonight",
  lock_plugin_commit = true,
  max_highlight_line_count = 10000,
  enable_imselect = false,
  enable_very_magic_search = false,
  fix_windows_clipboard = false,

  ---@class Commonkeys
  keys = {
    leader_key = ",",
    -- quick save / quite
    n_save = "<leader>w", -- :w
    n_force_quit = "<leader>q", -- :qa!
    -- quick move
    n_v_5j = "<C-j>",
    n_v_5k = "<C-k>",
    n_v_10k = "<C-u>",
    n_v_10j = "<C-d>",
    fold = {
      open = "zo",
      close = "zc",
    },
    terminal_to_normal = "<Esc>",
  },

  ---@class SWindowConfig
  s_windows = {
    enable = true,
    keys = {
      split_vertically = "sv",
      split_horizontally = "sh",
      -- close current
      close = "sc",
      -- close others
      close_others = "so",
      -- jump between windows
      jump_left = { "<A-h>", "<leader>h" },
      jump_right = { "<A-l>", "<leader>l" },
      jump_up = { "<A-k>", "<leader>k" },
      jump_down = { "<A-j>", "<leader>j" },
      -- control windows size
      width_decrease = "s,",
      width_increase = "s.",
      height_decrease = "sj",
      height_increase = "sk",
      size_equal = "s=",
    },
  },

  ---@class STabConfig
  s_tab = {
    enable = false,
    keys = {
      split = "ts",
      prev = "th",
      next = "tl",
      first = "tj",
      last = "tk",
      close = "tc",
    },
  },

  ---@class CMPConfig
  cmp = {
    enable = true,
    keys = {
      confirm = "<CR>",
      select_next_item = "<C-j>",
      select_prev_item = "<C-k>",
      scroll_doc_up = "<C-u>",
      scroll_doc_down = "<C-d>",
      complete = "<A-.>",
      abort = "<A-,>",
      -- luasnip
      snip_jump_next = "<C-l>",
      snip_jump_prev = "<C-h>",
      snip_next_choice = "<C-j>",
      snip_prev_choice = "<C-k>",
    },
  },

  ---@class NotifyConfig
  notify = {
    enable = true,
    ---@type number in millionsecond
    timeout = 3000,
    ---@type 'fade' | 'static' | 'slide'
    stages = "fade",
    ---@type  'defalut' | 'minimal' | 'simple'
    render = "minimal",
  },

  ---@class NvimTreeConfig
  nvimTree = {
    enable = true,
    keys = {
      toggle = { "<A-m>", "<leader>m" },
      refresh = "R",
      -- open / close --
      edit = { "o", "<2-LeftMouse>" },
      close = "<BS>", -- close parent folder
      system_open = "<CR>",
      vsplit = "sv",
      split = "sh",
      tabnew = "st",
      -- movement --
      parent_node = "P",
      first_sibling = "K",
      last_sibling = "J",
      cd = ">",
      dir_up = "<",
      -- file toggle --
      toggle_git_ignored = "i", --.gitignore (git enable)
      toggle_dotfiles = ".", -- Hide (dotfiles)
      toggle_custom = "u", -- togglle custom config
      -- file operate --
      create = "a",
      remove = "d",
      rename = "r",
      cut = "x",
      copy = "c",
      paste = "p",
      copy_name = "y",
      copy_path = "Y",
      copy_absolute_path = "gy",
      toggle_file_info = "gh",
    },
  },

  ---@class BufferLineConfig
  bufferLine = {
    enable = true,
    keys = {
      -- left / right cycle
      prev = "<C-h>",
      next = "<C-l>",
      -- close current buffer
      close = "<C-w>", -- close = "<leader>bc",
      -- close all left / right tabs
      close_left = "<leader>bh",
      close_right = "<leader>bl",
      -- close all other tabs
      close_others = "<leader>bo",
      close_pick = "<leader>bp",
    },
  },

  ---@class TelescopeConfig
  telescope = {
    enable = true,
    keys = {
      find_files = { "<C-p>", "ff" },
      live_grep = "<C-f>",
      -- super find  "xx" -tmd ---@see telescope-live-grep-args.nvim
      live_grep_args = "sf",
      -- up and down
      move_selection_next = "<C-j>",
      move_selection_previous = "<C-k>",
      -- history
      cycle_history_next = "<Down>",
      cycle_history_prev = "<Up>",
      -- close window
      close = "<esc>",
      -- scrolling in preview window
      preview_scrolling_up = "<C-u>",
      preview_scrolling_down = "<C-d>",
    },
  },

  ---@class SurroundConfig
  surround = {
    enable = true,
    keys = {
      -- you surround
      normal = "ys",
      -- you surround line
      normal_cur = "yss",
      delete = "ds",
      change = "cs",
      -- visual mode
      visual = "s",
      visual_line = "gs",
      -- disable
      insert = false,
      insert_line = false,
      normal_line = false,
      normal_cur_line = false,
    },
  },

  ---@class VENNConfig
  venn = {
    enable = true,
    keys = {
      -- toggle keymappings for venn using <leader>v
      toggle = "<leader>v",
      up = "K",
      down = "J",
      left = "H",
      right = "L",
      -- draw a box by pressing "f" with visual selection
      draw_box = "f",
    },
  },

  ---@class ZenConfig
  zen = {
    enable = true,
    keys = {
      toggle = "<leader>z",
    },
  },

  ---@class CommentConfig
  comment = {
    enable = true,
    -- normal mode
    toggler = {
      line = "gcc", -- line comment
      block = "gbc", -- block comment
    },
    -- visual mode
    opleader = {
      line = "gc",
      bock = "gb",
    },
  },

  ---@class ToggleTermConfig
  toggleterm = {
    -- enable 3 builtin terminal <leader>t a/b/c
    enable = true,
    toggle_float_window = "<leader>ta",
    toggle_float_window_command = nil,
    toggle_side_window = "<leader>tb",
    toggle_side_window_command = nil,
    toggle_bottom_window = "<leader>tc",
    toggle_bottom_window_command = nil,
  },

  ------------------------------------
  -- shared LSP keys
  ------------------------------------

  ---@class LSPConfig
  lsp = {
    -- jumps to the declaration
    definition = "gd",
    -- jumps to the declaration, many servers do not implement this method
    declaration = false,
    -- displays hover information
    hover = "gh",
    -- lists all the implementations
    implementation = "gi",
    -- lists all the references to the symbol
    references = "gr",

    rename = "<leader>rn",
    code_action = "<leader>ca",
    format = "<leader>f",
    -- diagnostic
    open_flow = "gp",
    goto_next = "gj",
    goto_prev = "gk",
    list = "gl",
  },

  ------------------------------------
  -- shared DAP keys
  ------------------------------------

  ---@class DAPConfig
  dap = {
    -- start, stop
    continue = "<leader>dc",
    terminate = "<leader>de",
    --  stepOver, stepInto, stepOut,
    step_over = "<leader>dj",
    step_into = "<leader>di",
    step_out = "<leader>do",
    -- breakpoints
    toggle_breakpoint = "<leader>dt",
    clear_breakpoints = "<leader>dT",
    eval = "<leader>dh",
  },

  ------------------------------------
  -- shared Test keys
  ------------------------------------

  ---@class NeotestConfig
  neotest = {
    toggle = "<leader>nt",
    run = "<leader>nr",
    run_file = "<leader>nf",
    run_dap = "<leader>nd",
    run_stop = "<leader>ns",
    output_open = "<leader>gh",
  },

  ------------------------------------
  -- Languages config
  ------------------------------------

  ---@class FrontendConfig
  frontend = {
    enable = false,
    linter = "eslint_d",
    ---@type "eslint_d" | "prettier"
    formatter = "prettier",
    format_on_save = false,
    cspell = false,
    tailwindcss = true,
    prisma = false,
    -- vue will take over typescript lsp
    vue = false,
    -- extra lsp command provided by typescript.nvim
    typescript = {
      keys = {
        ts_organize = "gs",
        ts_rename_file = "gR",
        ts_add_missing_import = "ga",
        ts_remove_unused = "gu",
        ts_fix_all = "gf",
        ts_goto_source = "gD",
      },
    },
  },

  ---@class ClangdConfig
  clangd = {
    enable = false,
    lsp = "clangd",
    -- linter = "clangd-tidy",
    formatter = "clang-format",
    format_on_save = false,
  },

  ---@class GolangConfig
  golang = {
    enable = false,
    lsp = "gopls",
    linter = "golangci-lint",
    formatter = "gofmt",
    format_on_save = false,
  },

  ---@class LuaConfig
  lua = {
    enable = true,
    lsp = "lua_ls",
    formatter = "stylua",
    format_on_save = true,
  },

  ---@class RustConfig
  rust = {
    enable = false,
    lsp = "rust_analyzer",
    -- rustup component add rustfmt
    formatter = "rustfmt",
    format_on_save = false,
  },

  ---@class BashConfig
  bash = {
    enable = false,
    lsp = "bashls",
    --  brew install shfmt
    formatter = "shfmt",
    format_on_save = false,
  },

  ---@class PythonConfig
  python = {
    enable = true,
    -- can be pylsp or pyright
    lsp = "pyright",
    -- pip install black
    -- asdf reshim python
    formatter = "black",
    format_on_save = false,
  },

  ---@class RubyConfig
  ruby = {
    enable = false,
    lsp = "ruby_ls",
    -- gem install rubocop
    formatter = "rubocop",
    format_on_save = false,
  },

  ---@class JsonConfig
  json = {
    enable = false,
    lsp = "jsonls",
    -- npm install -g fixjson
    ---@type "fixjson" | "prettier"
    formatter = "fixjson",
    format_on_save = false,
  },

  ---@class MarkdownConfig
  markdown = {
    enable = false,
    mkdnflow = {
      next_link = "gn",
      prev_link = "gp",
      next_heading = "gj",
      prev_heading = "gk",
      go_back = "<C-o>",
      follow_link = "gd",
      toggle_item = "tt",
    },
    formatter = "prettier",
    format_on_save = false,
  },

  ---@class TomlConfig
  toml = {
    enable = false,
    lsp = "taplo",
  },

  ---@class YamlConfig
  yaml = {
    enable = false,
    lsp = "yamlls",
    ---@type "prettier" | false
    formatter = "prettier",
    format_on_save = false,
  },

  ---@class DockerConfig
  docker = {
    enable = false,
    lsp = "dockerls",
  },

  ---@class GitConfig
  git = {
    enable = true,
    code_actions = "gitsigns",
    -- sign display
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  },

  ---@class MirrorConfig
  mirror = {
    -- treesitter = "https://kgithub.com/",
    treesitter = false,
    packer = "https://github.com/",
    -- TODO: LSP DAP mirror config
    -- carefully change these value
  },
}
return UserConfig
