local present, packer = pcall(require, "plugins.packerInit")

if not present then
	return false
end

local plugins = {
	{
		"wbthomason/packer.nvim",
		event = "VimEnter",
	},
	{ "nvim-lua/plenary.nvim" },
	{ "lewis6991/impatient.nvim" },
	{ "moll/vim-bbye" },
	{ "nathom/filetype.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "folke/tokyonight.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "sainnhe/gruvbox-material" },
	-- {
	--   "lunarvim/onedarker.nvim",
	--   config = function()
	--     require("onedarker").setup()
	--   end,
	-- },
	-- {
	--   "rmehri01/onenord.nvim",
	--   config = function()
	--     require("onenord").setup()
	--   end,
	-- },
	-- { "shaunsingh/nord.nvim" },
	{
		"goolord/alpha-nvim",
		-- event = "BufWinEnter",
		config = function()
			require("plugins.configs.alpha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		after = "nvim-web-devicons",
		-- after = "lualine-lsp-progress",
		config = function()
			require("plugins.configs.lualine")
		end,
	},
	-- {
	--    'arkav/lualine-lsp-progress',
	--    after = "nvim-gps"
	-- },
	{
		"akinsho/bufferline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.bufferline")
		end,
		setup = function()
			require("core.keymaps").bufferline_setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "BufRead",
		config = function()
			require("plugins.configs.indentline")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("plugins.configs.colorizer")
		end,
	},
	-- StartupTime
	{
		"dstein64/vim-startuptime",
		opt = true,
		cmd = { "StartupTime" },
	},
	-- 取消搜索高亮
	--[[ {
    "romainl/vim-cool",
    opt = true,
    event = { "CursorMoved", "InsertEnter" },
  }, ]]
	{
		"jdhao/better-escape.vim",
		opt = true,
		event = "InsertEnter",
	},
	{
		"lewis6991/gitsigns.nvim",
		opt = true,
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("plugins.configs.gitsigns")
		end,
		setup = function()
			require("core.utils").packer_lazy_load("gitsigns.nvim")
		end,
	},
	{
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.autopairs")
		end,
	},
	{
		"numToStr/Comment.nvim",
		module = "Comment",
		keys = { "gcc" },
		config = function()
			require("plugins.configs.comment")
		end,
		setup = function()
			require("core.keymaps").comment_setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require("plugins.configs.nvim-tree")
		end,
		setup = function()
			require("core.keymaps").nvimtree_setup()
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		event = "BufRead",
		config = function()
			require("scrollbar").setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		branch = "stable",
		event = "BufRead",
		config = function()
			require("mini.surround").setup()
		end,
	},
	------------------------------- Treesitter ---------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		-- event = { "BufRead", "BufNewFile" },
		run = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
		setup = function()
			require("core.keymaps").treesitter_setup()
		end,
	},
	-- {
	--    "SmiteshP/nvim-gps",
	--    after = "nvim-treesitter",
	-- },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
	},
	{
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"xml",
		},
	},
	{
		"stevearc/aerial.nvim",
		setup = function()
			require("core.keymaps").aerial_setup()
		end,
		config = function()
			require("plugins.configs.aerial")
		end,
	},
	-- {
	--   "p00f/nvim-ts-rainbow",
	--   after = "nvim-treesitter",
	--   event = "BufRead",
	-- },
	------------------------------- Treesitter End ---------------------------------
	--
	-------------------------------- Lsp Config ------------------------------------
	{
		"neovim/nvim-lspconfig",
		module = "lspconfig",
		opt = true,
		setup = function()
			require("core.utils").packer_lazy_load("nvim-lspconfig")
			-- reload the current file so lsp actually starts for it
			vim.defer_fn(function()
				vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
			end, 0)
		end,
		config = function()
			require("plugins.configs.lsp")
		end,
	},
	{
		"williamboman/nvim-lsp-installer",
		after = "nvim-lspconfig",
		setup = function()
			vim.cmd([[packadd nvim-lsp-installer]])
			require("core.utils").packer_lazy_load("nvim-lsp-installer")
		end,
	},
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		-- after = "nvim-lspconfig",
		-- setup = function()
		--    vim.cmd [[packadd null-ls.nvim]]
		--    require("core.utils").packer_lazy_load "null-ls.nvim"
		-- end,
		-- config = function()
		--    require("plugins.configs.lsp.null-ls")
		-- end
	},
	{
		"b0o/schemastore.nvim",
	},
	{
		"ray-x/lsp_signature.nvim",
		-- event = "BufRead",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lsp_signature")
		end,
	},
	{ "antoinemadec/FixCursorHold.nvim" }, -- This is needed to fix lsp doc highlight
	{
		"folke/trouble.nvim",
		config = function()
			require("plugins.configs.trouble")
		end,
		setup = function()
			require("core.keymaps").trouble_setup()
		end,
	},
	-- {
	--    "filipdutescu/renamer.nvim",
	--    event = "InsertEnter",
	--    setup = function()
	--       require("core.keymaps").renamer_setup()
	--    end,
	--    config = function()
	--       require "plugins.configs.renamer"
	--    end
	-- },
	-------------------------------- Lsp Config End ------------------------------------
	--
	------------------------------- Cmp ------------------------------------
	{
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
	},
	{
		"hrsh7th/nvim-cmp",
		commit = "4f1358e659d51c69055ac935e618b684cf4f1429",
		after = "friendly-snippets",
		config = function()
			require("plugins.configs.cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.lua_snip")
		end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
		after = "LuaSnip",
	},
	{
		"hrsh7th/cmp-nvim-lua",
		after = "cmp_luasnip",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		after = "cmp-nvim-lua",
		setup = function()
			vim.cmd([[packadd cmp-nvim-lsp]])
		end,
	},
	{
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-buffer",
		after = "cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-path",
		after = "cmp-buffer",
	},
	------------------------------- Cmp End ------------------------------------
	--
	------------------------ Telescope ------------------------------
	{
		"nvim-telescope/telescope.nvim",
		module = "telescope",
		cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
		end,
		setup = function()
			require("core.keymaps").telescope_setup()
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		after = "telescope.nvim",
		-- event = "BufRead",
		run = "make",
		setup = function()
			vim.cmd([[packadd telescope-fzf-native.nvim]])
		end,
	},
	-- {
	--   "nvim-telescope/telescope-project.nvim",
	--   opt = true,
	--   after = "telescope-fzf-native.nvim",
	--   -- event = "BufWinEnter",
	--   setup = function()
	--     vim.cmd [[packadd telescope-project.nvim]]
	--   end,
	-- },
	{ "ahmedkhalf/project.nvim" },
	------------------------ Telescope End ------------------------------
	--
	------------------------ Navigation -----------------------------
	{
		"phaazon/hop.nvim",
		cmd = {
			"HopLine",
			"HopLineStart",
			"HopWord",
			"HopPattern",
			"HopChar1",
			"HopChar2",
		},
		setup = function()
			require("core.keymaps").hop_setup()
		end,
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	-- {
	--    "ggandor/lightspeed.nvim",
	--    event = "BufRead",
	--    config = function()
	--       require "plugins.configs.lightspeed"
	--    end
	-- },
	{
		"andymass/vim-matchup",
		opt = true,
		setup = function()
			require("core.utils").packer_lazy_load("vim-matchup")
		end,
	},
	------------------------ Navigation End -----------------------------
	--
	------------------------ Terminal ----------------------------------
	{
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},
	------------------------ Terminal End -----------------------------

	{
		"mbbill/undotree",
		setup = function()
			require("core.keymaps").undotree_setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		opt = true,
		event = "BufReadPre",
		module = { "dap" },
		wants = {
			"nvim-dap-virtual-text",
			"nvim-dap-ui",
		},
		requires = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("plugins.configs.dap").setup()
		end,
	},

	{
		"rmagatti/goto-preview",
		opt = true,
		config = function()
			require("core.keymaps").gotopreview_setup()
			require("goto-preview").setup({

				width = 120, -- Width of the floating window
				height = 15, -- Height of the floating window
				border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- references = { -- Configure the telescope UI for slowing the references cycling window.
				--   telescope = telescope.themes.get_dropdown { hide_preview = false },
				-- },
				-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
				focus_on_open = true, -- Focus the floating window when opening it.
				dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
				force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
				bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
			})
		end,
	},
}

return packer.startup(function(use)
	for _, v in pairs(plugins) do
		use(v)
	end
end)
