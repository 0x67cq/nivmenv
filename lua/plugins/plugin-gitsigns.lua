return {
-- git 相关操作
    {
		"lewis6991/gitsigns.nvim",
		init = function()
			require("configs.coding.gitsigns")
		end,
	},
}
