local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

vim.keymap.set("n", "<C-/>", ":lua require('Comment.api').toggle.linewise.current()<CR>")
-- vim.keymap.set("v", "<C-/>", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
vim.keymap.set("v", "<C-/>", ":lua require('Comment.api').locked(\"toggle.blockwise\")(vim.fn.visualmode())<CR>")

comment.setup({
	opleader = {
		line = "<leader>/",
		block = "<leader>/",
	},
})
