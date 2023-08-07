return {
    -- RGB显色
    {
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		init = function()
			require("colorizer").setup()
		end,
	},
}
