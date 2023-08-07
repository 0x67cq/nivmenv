local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

local m = {
    toggle = [[<c-\>]],
    close = "<esc>",
    quit_insert = "jk",
    up = "<C-k>",
    down = "<C-j>",
    left = "<C-h>",
    right = "<C-l>",
}

toggleterm.setup({
    size = 20,
    open_mapping = m.toggle,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    -- direction = "float",
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", m.close, [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", m.quit_insert, [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", m.left, [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", m.down, [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", m.up, [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", m.right, [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end
