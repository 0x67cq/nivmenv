return {
	{
		"tpope/vim-dadbod",
		init = function()
			vim.cmd("let g:dbs = []")
			vim.cmd("let g:db_ui_save_location = '~/.config/dbui'")
		end,
	},
	{ "kristijanhusak/vim-dadbod-ui", after = "vim-dadbod" },
}
