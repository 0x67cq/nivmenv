return {
-- 滚动页面效果
    {
		"petertriho/nvim-scrollbar",
		event = "BufRead",
		init = function()
			require("scrollbar").setup()
		end,
	},
}
