return {
    -- 上边缘tab页(可以再找找看)
    {
	"akinsho/bufferline.nvim",
		lazy = true,
		event = "BufRead",
		init = function()
			require("configs.editor.bufferline")
		end,
    },
}
