return {
	{
		"phaazon/hop.nvim",
		-- require("core.keymaps").hop_setup()
		init = function()
			vim.keymap.set("n", "<leader>mm", ":<C-u>HopWord<CR>")
			vim.keymap.set("n", "<leader>ml", ":<C-u>HopLine<CR>")
			vim.keymap.set("n", "t", ":<C-u>HopChar1<CR>")
			vim.keymap.set("n", "<leader>ms", ":<C-u>HopChar2<CR>")
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
}
