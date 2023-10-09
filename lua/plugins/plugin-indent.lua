return {
	-- 缩进线
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		main = "ibl",
		opts = {
			indent = {
				char = { "│" },
			},
			enabled = true,
			-- char = "┊",
			exclude = {
				"help",
				"terminal",
				"starter",
				"nvim-tree",
				"packer",
				"lspinfo",
				"TelescopePrompt",
				"TelescopeResults",
				"mason",
				"",
			},
			buftype_exclude = { "terminal" },
			show_trailing_blankline_indent = false,
			show_first_indent_level = false,
			show_current_context = false,
		},
	},
}
