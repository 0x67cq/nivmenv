return {
-- 抽象语法树渲染
    {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			require("configs.coding.treesitter")
		end,
			-- require("core.keymaps").treesitter_setup()
	},

    -- 展示抽象语法树&直接修改显色值
	{ "nvim-treesitter/playground",
	    dependencies = {"nvim-treesitter"},
    },
    -- 函数声明行保留首行
    {
        "nvim-treesitter/nvim-treesitter-context",
	    dependencies = {"nvim-treesitter"},
    },
}
