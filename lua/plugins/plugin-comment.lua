return {
	-- 自动注释
	{
		"numToStr/Comment.nvim",
		init = function()
			require("configs.coding.comment")
		end,
		-- init = function()
		-- require("core.keymaps").comment_setup()
		--end,
	},
}
