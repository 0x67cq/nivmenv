return {
    -- start screen
    {	
        "goolord/alpha-nvim",
		init = function()
			require("configs.editor.alpha")
		end,
    }
}
