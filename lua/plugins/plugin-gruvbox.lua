return {
	{ "sainnhe/gruvbox-material",
      lazy = false,
      priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox-material]])
    end,
},
}
