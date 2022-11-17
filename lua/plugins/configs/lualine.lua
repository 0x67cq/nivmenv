local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

-- local gps_status_ok, gps = pcall(require, "nvim-gps")
-- if not gps_status_ok then
-- 	return
-- end

-- gps.setup({
-- 	icons = {
-- 		["class-name"] = " ", -- Classes and class-like objects
-- 		["function-name"] = " ", -- Functions
-- 		["method-name"] = " ", -- Methods (functions inside class-like objects)
-- 	},
-- 	languages = {
-- 		-- You can disable any language individually here
-- 		["c"] = true,
-- 		["cpp"] = true,
-- 		["go"] = true,
-- 		["java"] = true,
-- 		["javascript"] = true,
-- 		["lua"] = true,
-- 		["python"] = true,
-- 		["rust"] = true,
-- 	},
-- 	separator = " > ",
-- })

-- local function gps_content()
-- 	if gps.is_available() then
-- 		return gps.get_location()
-- 	else
-- 		return ""
-- 	end
-- end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " ", info = " " },
    -- colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    -- colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local mode = {
    "mode",
    -- fmt = function(str)
    -- 	return "-- " .. str .. " --"
    -- end,
}

local filetype = {
    "filetype",
    icons_enabled = true,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

-- local location = {
-- 	"location",
-- 	padding = 0,
-- }

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local mini_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
}
local aerial = {
    sections = mini_sections,
    filetypes = { "aerial" },
}

lualine.setup {
    options = {
        icons_enabled = true,
        -- theme = "catppuccin",
        -- theme = "tokyonight",
        theme = "auto",
        component_separators = { left = "", right = "" },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        -- section_separators = { left = " ", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, diagnostics },
        lualine_c = {
            {
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
            -- { gps_content, cond = gps.is_available },
        },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        -- lualine_x = { diff, spaces, "encoding", "filetype" },
        lualine_x = { diff, "filesize", "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {
        -- aerial,
    },
}
