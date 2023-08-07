return {
-- 断点调试 client & ui
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			-- require("configs.configs.dap").setup()
		end,
	},
}
