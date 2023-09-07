local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

local api = require('Comment.api')

--vim.keymap.set('n', '<C-/>', api.toggle.linewise.current)
--vim.keymap.set("n", "<C-/>", ":lua require('Comment.api').toggle.linewise.current()<CR>")

-- vim.keymap.set('v', '<C-/>', api.toggle.blockwise.current)
-- vim.keymap.set("v", "<C-/>", ":lua require('Comment.api').locked(\"toggle.blockwise\")(vim.fn.visualmode())<CR>")

comment.setup({
    ignore = '^$',
    toggler = {
        line = '<leader>c',
        --block = '<leader>c',
    },
    opleader = {
        --line = "<leader>cc",
        block = "<leader>cc",
    },
})
