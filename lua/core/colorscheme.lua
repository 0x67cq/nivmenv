-- vim.g.gruvbox_material_transparent_background = 1
-- vim.g.gruvbox_material_palette = "mix"
-- vim.g.gruvbox_material_better_performance = 1

vim.g.tokyonight_transparent = true

--local colorscheme = "tokyonight"
local colorscheme = "gruvbox-material"

-- require("nightfox").setup {
--   options = {
--     transparent = true, -- Disable setting background
--     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     -- styles = {              -- Style to be applied to different syntax groups
--     --   comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
--     --   conditionals = "NONE",
--     --   constants = "NONE",
--     --   functions = "NONE",
--     --   keywords = "NONE",
--     --   numbers = "NONE",
--     --   operators = "NONE",
--     --   strings = "NONE",
--     --   types = "NONE",
--     --   variables = "NONE",
--     -- },
--   },
-- }

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
