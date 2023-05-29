local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local m = require("core.keymaps").telescope

-- local previewers = require "telescope.previewers"
-- local sorters = require "telescope.sorters"
local actions = require("telescope.actions")

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job:new({
		command = "file",
		args = { "--mime-type", "-b", filepath },
		on_exit = function(j)
			local mime_type = vim.split(j:result()[1], "/")[1]
			if mime_type == "text" then
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			else
				-- maybe we want to write something to the buffer here
				vim.schedule(function()
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
				end)
			end
		end,
	}):sync()
end

telescope.setup({
	defaults = {
		buffer_previewer_maker = new_maker,
		-- file_previewer = previewers.vim_buffer_cat.new,
		-- grep_previewer = previewers.vim_buffer_vimgrep.new,
		-- qflist_previewer = previewers.vim_buffer_qflist.new,
		-- file_sorter = sorters.get_fuzzy_file,
		-- generic_sorter = sorters.get_generic_fuzzy_sorter,
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		-- selection_strategy = "reset",
		-- sorting_strategy = "descending",
		-- layout_strategy = "horizontal",
		-- layout_config = {
		--   width = 0.98,
		--   preview_cutoff = 120,
		--   horizontal = {
		--     preview_width = function(_, cols, _)
		--       if cols < 120 then
		--         return math.floor(cols * 0.5)
		--       end
		--       return math.floor(cols * 0.6)
		--     end,
		--     mirror = false,
		--   },
		--   vertical = { mirror = false },
		-- },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		mappings = {
			i = {
				[m.cycle_history_next] = actions.cycle_history_next,
				[m.cycle_history_prev] = actions.cycle_history_prev,

				[m.move_selection_next] = actions.move_selection_next,
				[m.move_selection_previous] = actions.move_selection_previous,

				[m.close] = actions.close,

				[m.select_default] = actions.select_default,
				[m.select_horizontal] = actions.select_horizontal,
				[m.select_vertical] = actions.select_vertical,

				[m.preview_scrolling_up] = actions.preview_scrolling_up,
				[m.preview_scrolling_down] = actions.preview_scrolling_down,

				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},

			n = {
				[m.select_default] = actions.select_default,
				[m.select_horizontal] = actions.select_horizontal,
				[m.select_vertical] = actions.select_vertical,

				[m.n_close] = actions.close,

				[m.move_selection_next] = actions.move_selection_next,
				[m.move_selection_previous] = actions.move_selection_previous,

				[m.preview_scrolling_up] = actions.preview_scrolling_up,
				[m.preview_scrolling_down] = actions.preview_scrolling_down,

				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

				-- [m.move_to_top] = actions.move_to_top,
				-- [m.move_to_middle] = actions.move_to_middle,
				-- [m.move_to_bottom] = actions.move_to_bottom,
				-- [m.move_to_top_gg] = actions.move_to_top,
				-- [m.move_to_bottom_G] = actions.move_to_bottom,
			},
		},
		file_ignore_patterns = {},
		path_display = { shorten = { len = 3, exclude = { 1, -1 } } },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
			},
			live_grep = {
				--@usage don't include the filename in the search results
				only_sort_text = true,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		project = {
			base_dirs = {
				"~/syncnote",
			},
			hidden_files = true, -- default: false
			theme = "dropdown",
			order_by = "asc",
			sync_with_nvim_tree = true, -- default false
		},
	},
})

require("plugins.configs.project")

--[[ telescope.load_extension "projects" ]]
telescope.load_extension("project")
telescope.load_extension("fzf")
