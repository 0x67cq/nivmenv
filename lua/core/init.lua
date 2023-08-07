-- 用于加载core所有的lua文件.
-- core 包括: nvim 原生功能配置优化以及autocmd
local M = {}
-- 启动加速，等下看看是怎么玩的
-- vim.loader.enable()
-- { "lewis6991/impatient.nvim" },

local core_modules = {
    "core.options",
    "core.autocmds",
    "core.keymaps",
}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end

vim.cmd("source ~/.config/nvim/lua/core/oldvimL.vim")
vim.cmd("source ~/.config/nvim/lua/core/gkeymaps.vim")
-- python3 兼容
vim.cmd("let g:python3_host_prog = '/usr/local/bin/python3'")

return M
