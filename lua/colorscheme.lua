vim.o.background = "dark"
vim.g.tokyonight_style = "storm" -- day / night
-- 半透明
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "NeoSolarized"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
-- neosolarized
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
    -- I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
    -- style more, set this value to 0.
    vim.g.neosolarized_vertSplitBgTrans = 1
    -- Special characters such as trailing whitespace, tabs, newlines, when displayed 
    -- using ":set list" can be set to one of three levels depending on your needs. 
    -- Default value is "normal". Provide "high" and "low" options.
    vim.g.neosolarized_visibility = "high"
    -- If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized 
    -- typefaces, simply assign 1 or 0 to the appropriate variable. Default values:  
    vim.g.neosolarized_bold = 1
    vim.g.neosolarized_underline = 1
    vim.g.neosolarized_italic = 0
    vim.o.background=dark
    vim.g.solarized_termcolors=256
  return
end
