local status, tagbar = pcall(require, "targbar")
if not status then
  vim.notify("没有找到 targbar")
  return
end

tagbar.setup({
    --"ctags程序的路径
    vim.g.tagbar_ctags_bin=vim.fn.stdpath("config").'/exe/ctags'
    --"窗口宽度的设置
    vim.g.tagbar_width=30
})
