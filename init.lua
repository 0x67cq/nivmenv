local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

local core_modules = {
  "core.options",
  "core.autocmds",
  "core.keymaps",
  "core.colorscheme",
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

-- non plugin mappings
require("core.keymaps").init()

vim.cmd 'source ~/.config/nvim/lua/core/oldvimL.vim'
vim.cmd 'source ~/.config/nvim/lua/core/gkeymaps.vim'
