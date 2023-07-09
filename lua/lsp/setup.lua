local lsp_installer = require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "clangd",
    -- "lua_ls",
    -- "tsserver",
    -- "tailwindcss",
    "bashls",
    "cssls",
    -- "dockerls",
    -- "emmet_ls",
    "html",
    "jsonls",
    "pyright",
    -- "rust_analyzer",
    -- "taplo",
    "yamlls",
    -- "gopls",
  }
})
local lspconfig = require("lspconfig")

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  pyright = require("lsp.config.common"),
  -- lua_ls = require("lsp.config.common"), -- lua/lsp/config/lua.lua
  -- lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  bashls = require("lsp.config.bash"),
  html = require("lsp.config.html"),
  -- cssls = require("lsp.config.css"),
  -- emmet_ls = require("lsp.config.emmet"),
  jsonls = require("lsp.config.json"),
  yamlls = require("lsp.config.common"),
  -- tsserver = require("lsp.config.ts"),
  -- yamlls = require("lsp.config.yamlls"),
  -- dockerls = require("lsp.config.docker"),
  -- tailwindcss = require("lsp.config.tailwindcss"),
  -- rust_analyzer = require("lsp.config.rust"),
  -- taplo = require("lsp.config.taplo"), -- toml
  -- remark_ls = require("lsp.config.markdown"),
  -- clangd = require("lsp.config.clangd"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({
      on_attach = on_attach(),
    })
  end
end
