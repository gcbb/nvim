-- 自动安装 Packer.nvim
-- 插件安装目录
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--
-- -- ~/.local/share/nvim/site/pack/packer/
-- local fn = vim.fn
-- local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- local paccker_bootstrap
-- if fn.empty(fn.glob(install_path)) > 0 then
--   vim.notify("正在安装Pakcer.nvim，请稍后...")
--   paccker_bootstrap = fn.system({
--     "git",
--     "clone",
--     "--depth",
--     "1",
--    -- "https://github.com/wbthomason/packer.nvim",
--     -- "https://kgithub.com/wbthomason/packer.nvim",
--     "https://gitcode.net/mirrors/wbthomason/packer.nvim",
--     install_path,
--   })
--
--   -- https://github.com/wbthomason/packer.nvim/issues/750
--   -- local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
--   -- if not string.find(vim.o.runtimepath, rtp_addition) then
--   --  vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
--   -- end
--   vim.notify("Pakcer.nvim 安装完毕")
-- end

-- Use a protected call so we don't error out on first use
-- local status_ok, packer = pcall(require, "lazy")
-- if not status_ok then
--   vim.notify("没有安装 packer.nvim")
--   return
-- end



local plug_list = {
  {

    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    {"folke/neodev.nvim", config = true},
    -------------------------- plugins -------------------------------------------
    --  'keaising/im-select.nvim'
    -- {'neoclide/coc.nvim',
    --   branch = 'master', 
    --   build = 'yarn install --frozen-lockfile',
    --   event = "VeryLazy",
    --   enabled = "false"
    -- },
    -- GPT
    {
      "dpayne/CodeGPT.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
      },
      event = "VeryLazy"
      -- config = function()
      --    require("codegpt.config")
      -- end

    },
    {"github/copilot.vim",  event = "VeryLazy"},
    { 'majutsushi/tagbar', event = "VeryLazy"},
    -- ,{ 'sjl/gundo.vim', init = function() vim.g.gundo_auto_preview = 1 end }
    {'mbbill/undotree', event = "VeryLazy"},
    -- , {'sindrets/undoquit.vim'}

    -- markdown
    -- install without yarn or npm
    { "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      init = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
    },
    -- let g:gundo_prefer_python3=1
    -- tree
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional
        -- opt=true
      },
    },
    -- bufferline
    {
      "akinsho/bufferline.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye"},
    }
    -- lualine
    ,{
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons"},
      opts = {
        theme = 'tokyonight'
      }
    }
    ,("arkav/lualine-lsp-progress")
    -- -- telescope
    ,({
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    })
    -- -- telescope extensions
    ,("LinArcX/telescope-env.nvim")
    ,("nvim-telescope/telescope-ui-select.nvim")
    -- -- dashboard-nvim
    -- ,("glepnir/dashboard-nvim")
    -- project
    ,("ahmedkhalf/project.nvim")
    -- -- treesitter
    ,({
      "nvim-treesitter/nvim-treesitter",
      build = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end
    }),
    -- ,("p00f/nvim-ts-rainbow")
    -- -- indent-blankline
    ("lukas-reineke/indent-blankline.nvim"),
    -- --------------------- LSP --------------------
    -- Lspconfig
    --, 'williamboman/nvim-lsp-installer'
    {
      "neovim/nvim-lspconfig",
      -- event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
        { "folke/neodev.nvim", opts = {} },
        {"williamboman/mason.nvim", build = ":MasonUpdate"},
        "williamboman/mason-lspconfig.nvim",
        {
          "hrsh7th/cmp-nvim-lsp",
          -- cond = function()
          --   return require("lazyvim.util").has("nvim-cmp")
          -- end,
        },
      },
    },
    -- -- 补全引擎
    -- {
    --   "L3MON4D3/LuaSnip",
    --   -- follow latest release.
    --   -- install jsregexp (optional!:).
    --   build = "make install_jsregexp"
    -- },
    -- {
    --   "L3MON4D3/LuaSnip",
    --   dependencies = { "rafamadriz/friendly-snippets" },
    -- },
    'SirVer/ultisnips',
    'keelii/vim-snippets',
    {"hrsh7th/nvim-cmp"},
    -- -- Snippet 引擎
    {
      "hrsh7th/vim-vsnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    -- -- 补全源
    ("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    -- ,("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    -- ,("hrsh7th/cmp-path") -- { name = 'path' }
    -- ,("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- ,("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- -- 常见编程语言代码段
    ,("rafamadriz/friendly-snippets"),
    -- -- UI 增强
    ("onsails/lspkind-nvim"),
    -- ,("tami5/lspsaga.nvim"),
    -- -- 代码格式化
    ("mhartington/formatter.nvim"),
    { "jose-elias-alvarez/null-ls.nvim",
      dependencies = "nvim-lua/plenary.nvim" },
    -- -- TypeScript 增强
    -- ,({ "jose-elias-alvarez/nvim-lsp-ts-utils", dependencies = "nvim-lua/plenary.nvim" })
    -- -- Lua 增强
    ("folke/neodev.nvim")
    -- JSON 增强schemastore
    ,("b0o/schemastore.nvim")
    -- yml 
    -- -- Rust 增强
    -- ,("simrat39/rust-tools.nvim")
    -- --------------------- colorschemes --------------------
    -- tokyonight
    ,("folke/tokyonight.nvim")
    -- OceanicNext
    ,("mhartington/oceanic-next")
    , 'altercation/vim-colors-solarized'
    , 'overcache/NeoSolarized'
    -- gruvbox
    ,({
      "ellisonleao/gruvbox.nvim",
      dependencies = { "rktjmp/lush.nvim" },
    })

    -- zephyr
    ,("glepnir/zephyr-nvim")
    -- nord
    ,("shaunsingh/nord.nvim")
    -- onedark
    ,("ful1e5/onedark.nvim")
    -- nightfox
    ,("EdenEast/nightfox.nvim")

    -- -------------------------------------------------------
    --


    ,{ "akinsho/toggleterm.nvim" },
    -- -- surround
    -- ,("ur4ltz/surround.nvim")
    -- -- Comment
    {"numToStr/Comment.nvim"},
    --,("terrortylor/nvim-comment")
    -- ,("preservim/nerdcommenter")

    -- -- nvim-autopairs
    -- ,("windwp/nvim-autopairs"),
    -- git
    { "lewis6991/gitsigns.nvim",event = "VeryLazy" },
    -- vimspector
    {"puremourning/vimspector", event = "VeryLazy"},
    -- ----------------------------------------------
    ("mfussenegger/nvim-dap"),
    ("theHamsta/nvim-dap-virtual-text"),
    ("rcarriga/nvim-dap-ui"),
    -- ("Pocco81/DAPInstall.nvim"),
    -- ("jbyuki/one-small-step-for-vimkind"),
    --
    ("j-hui/fidget.nvim"),

    {'skywind3000/vim-terminal-help'},
    {'ggandor/leap.nvim'}
  },

  -- config = function(plugin)
  --     vim.opt.rtp:append(plugin.dir .. "/custom-rtp")
  -- end
  --  config = {
  --    -- 锁定插件版本在snapshots目录
  --    snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
  --    -- 这里锁定插件版本在v1，不会继续更新插件
  --    snapshot = "v1",
  --
  --    -- 最大并发数
  --    max_jobs = 16,
  --    -- 自定义源
  --    git = {
  --      --default_url_format = "https://hub.fastgit.xyz/%s",
  --      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
  --      -- default_url_format = "https://gitcode.net/mirrors/%s",
  --      -- default_url_format = "https://gitclone.com/github.com/%s",
  -- default_url_format = "https://github.com/%s",
  --    },
  --    -- display = {
  --    -- 使用浮动窗口显示
  --    --   open_fn = function()
  --    --     return require("packer.util").float({ border = "single" })
  --    --   end,
  --    -- },
  --  },
}

require("lazy").setup(plug_list)
vim.g.terminal_shell = 'pwsh'
-- 每次保存 plugins.lua 自动安装插件
-- move to autocmds.lua
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
