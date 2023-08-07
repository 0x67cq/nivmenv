return {
{
		"nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
		init = function()
			require("configs.editor.telescope")
		end,
			-- require("core.keymaps").telescope_setup()
	},
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }

}
