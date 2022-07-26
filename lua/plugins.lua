-- Only required if you have packer configured as `opt`
---@diagnostic disable: undefined-global
--在没有安装packer的电脑上，自动安装packer插件n
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    print("down packer")
    fn.system({'git', 'clone', '--depth', '1', 'https://gitclone.com/github.com/wbthomason/packer.nvim', install_path})	--默认地址
    vim.cmd 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
require('packer').init({
    git = {
        depth = 1, -- Git clone depth
        clone_timeout = 60, -- Timeout, in seconds, for git clones
        --default_url_format = "https://github.com/%s"
        default_url_format = "https://gitclone.com/github.com/%s"
    }
})
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lazy loading:
  -- Load on specific commands
--  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
--  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --use {
    --'w0rp/ale',
    --ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --cmd = 'ALEEnable',
    --config = 'vim.cmd[[ALEEnable]]'
  --}

  -- Plugins can have dependencies on other plugins
  --use {
    --'haorenW1025/completion-nvim',
    --opt = true,
    --requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  --}
 -- telescope
    --use({
      --"nvim-telescope/telescope.nvim",
      --requires = { "nvim-lua/plenary.nvim" },
    --})
    ---- telescope extensions
    --use("LinArcX/telescope-env.nvim")
    --use("nvim-telescope/telescope-ui-select.nvim")
    ---- dashboard-nvim
    --use("glepnir/dashboard-nvim")
    ---- project
    --use("ahmedkhalf/project.nvim")
  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

 --------------------- LSP --------------------
    --use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    --use({ "williamboman/nvim-lsp-installer" })
    -- Lspconfig
    --use({ "neovim/nvim-lspconfig" })
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    -- 补全引擎
    --use("hrsh7th/nvim-cmp")
    -- Snippet 引擎
    --use("hrsh7th/vim-vsnip")
    -- 补全源
    --use("hrsh7th/cmp-vsnip")
    --use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    --use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    --use("hrsh7th/cmp-path") -- { name = 'path' }
    --use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    --use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    ---- 常见编程语言代码段
    --use("rafamadriz/friendly-snippets")
    ---- UI 增强
    --use("onsails/lspkind-nvim")
    --use("tami5/lspsaga.nvim")
    ---- 代码格式化
    --use("mhartington/formatter.nvim")
    --use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    ---- TypeScript 增强
    --use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    ---- Lua 增强
    --use("folke/lua-dev.nvim")
    ---- JSON 增强
    --use("b0o/schemastore.nvim")
end)
