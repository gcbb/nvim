-- ,
--         config = function()
--             require('Comment').setup()
--         end

local status, comment = pcall(require, "nvim_comment")
if not status then
  vim.notify("没有找到 nvim_comment")
  return
end

local default_opts = {
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = nil
}
local us_table =vim.tbl_deep_extend("force", default_opts, require("keybindings").comment) 
--for key, value in pairs(us_table) do
--    print(key, value)
--end
-- 关闭了extra快捷键，只用keybindings里定义的基础快捷键
comment.setup(us_table)
