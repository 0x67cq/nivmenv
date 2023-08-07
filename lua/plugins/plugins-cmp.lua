return {
	-- 美化补全弹窗
	{
		"onsails/lspkind.nvim",
	},
	-- 补全
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("configs.coding.cmp")
		end,
	},
	-- TODO 找个时间去看一下 脚本这几个插件
	-- 加载脚本合集
	{
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
	},
	-- 脚本引擎
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("configs.coding.lua_snip")
		end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
		dependencies = { "L3MON4D3/LuaSnip" },
	},
	{
		"hrsh7th/cmp-nvim-lua",
		dependencies = { "saadparwaiz1/cmp_luasnip" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = { "hrsh7th/cmp-nvim-lua" },
		config = function() end,
	},
	{
		"hrsh7th/cmp-cmdline",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"hrsh7th/cmp-buffer",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
	},
	{
		"hrsh7th/cmp-path",
		dependencies = { "hrsh7th/cmp-buffer" },
	},
}
