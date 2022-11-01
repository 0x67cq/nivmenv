local utils = require "core.utils"

local map = utils.map
local nmap = utils.nmap
local imap = utils.imap

local cmd = vim.cmd

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local M = {}

M.init = function()
  ---------------------- Leader ---------------------------

  map("", "<Space>", "<Nop>")
  vim.g.mapleader = ";"
  vim.g.maplocalleader = ";"

  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  -- empty mode is same as using :map
  -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
  map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

  -- don't yank text on delete ( dd )
  -- map({ "n", "v" }, "d", '"_d')

  -------------------- Editor -----------------------
  nmap("H", "^")
  nmap("L", "$")

  -- 上下滚动浏览
  nmap("J", "5j")
  nmap("K", "5k")
  -- ctrl u / ctrl + d  只移动9行，默认移动半屏
  nmap("<C-u>", "15k")
  nmap("<C-d>", "15j")

  -- nmap("<A-s>", ":w! <CR>")
  -- imap("<A-s>", "<ESC>:w! <CR>")
  -- nmap("<A-q>", ":q <CR>")
  -- Move text up and down
  -- map("v", "<A-j>", ":m .+1<CR>==")
  -- map("v", "<A-k>", ":m .-2<CR>==")
  -- map("x", "<A-j>", ":move '>+1<CR>gv-gv")
  -- map("x", "<A-k>", ":move '<-2<CR>gv-gv")
  -- 缩进
  map("v", "<", "<gv")
  map("v", ">", ">gv")

  ----------------- Navigation ----------------------------
  -- navigation within insert mode
  imap("<A-h>", "<Left>")
  imap("<A-l>", "<Right>")
  imap("<A-k>", "<Up>")
  imap("<A-j>", "<Down>")
  imap("<A-S-l>", "<End>")
  imap("<A-S-h>", "<ESC>^i")

  -- easier navigation between windows
  nmap("<A-h>", "<C-w>h")
  nmap("<A-j>", "<C-w>j")
  nmap("<A-k>", "<C-w>k")
  nmap("<A-l>", "<C-w>l")

  ------------ Windows ----------------------------
  -- 分屏
  nmap("<leader>v", ":vsp<CR>")
  nmap("<leader>h", ":sp<CR>")
  -- 关闭当前
  nmap("sc", "<C-w>c")
  -- 关闭其他
  nmap("so", "<C-w>o") -- close others
  -- 相等比例
  nmap("s=", "<C-w>=")
  -- Resize with arrows
  nmap("<S-Up>", ":resize -2<CR>")
  nmap("<S-Down>", ":resize +2<CR>")
  nmap("<S-Left>", ":vertical resize -2<CR>")
  nmap("<S-Right>", ":vertical resize +2<CR>")

  ----------------------- Packer  -----------------
  nmap("<leader>ps", ":PackerSync <CR>")
  nmap("<leader>pc", ":PackerCompile <CR>")
  nmap("<leader>pi", ":PackerInstall <CR>")
  -- Add Packer commands because we are not loading it at startup
  cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
  cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
  cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
  cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
  cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
  cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

  nmap("<leader>ud", ":UndotreeToggle<cr>")
end

------------------------ Plugins Keymaps --------------------------------------------

M.bufferline_setup = function()
  nmap("<leader>bn", ":BufferLineCycleNext <CR>")
  nmap("<leader>bp", ":BufferLineCyclePrev <CR>")
  nmap("<leader>bnn", "<cmd>BufferLineMoveNext<cr>")
  nmap("<leader>bpp", "<cmd>BufferLineMovePrev<cr>")
  nmap("<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
  nmap("<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
  nmap("<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
  nmap("<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
  nmap("<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
  nmap("<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
  nmap("<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
  nmap("<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
  nmap("<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
end

M.comment_setup = function()
  map("n", "<C-/>", ":lua require('Comment.api').toggle.linewise.current()<CR>")
  map("v", "<C-/>", ":lua require('Comment.api').locked(\"toggle.blockwise\")(vim.fn.visualmode())<CR>")
end

M.lspconfig_setup = function()
  -- '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>',
  nmap("<leader>jv", ":vsplit | lua vim.lsp.buf.definition()<Enter>")
  nmap("<leader>js", ":belowright split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  nmap("<leader>gd", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  nmap("<leader>g", "<cmd>lua vim.lsp.buf.definition()<CR>")
  nmap("<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
  nmap("<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  nmap("<leader>gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  nmap("<leader>gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
  nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  nmap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  nmap("<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  nmap("<leader>gf", "<cmd>lua vim.diagnostic.open_float()<CR>")
  nmap("<leader>[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  nmap("<leader>]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  nmap("<leader>gsl", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  nmap("<leader>bg", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

M.nvimtree_setup = function()
  nmap("<C-n>", ":NvimTreeToggle <CR>")
end

M.telescope_setup = function()
  nmap("<leader>fb", ":Telescope buffers <CR>")
  nmap("<leader>ff", ":Telescope find_files <CR>")
  nmap("<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
  nmap("<leader>gm", ":Telescope git_commits <CR>")
  nmap("<leader>gs", ":Telescope git_status <CR>")
  nmap("<leader>fh", ":Telescope help_tags <CR>")
  nmap("<leader>fw", ":Telescope live_grep <CR>")
  nmap("<leader>fg", ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<CR>")
  nmap("<leader>fo", ":Telescope oldfiles <CR>")
  -- project manager
  nmap("<leader>pm", ":lua require'telescope'.extensions.project.project{}<CR>")
  --[[  打开项目管理窗口之后,esc切换到normal模式， 然后按下列快捷键
  --d	delete currently selected project
    r	rename currently selected project
    c	create a project*
    s	search inside files within your project
    b	browse inside files within your project
    w	change to the selected project's directory without opening it
    R	find a recently opened file within your project
    f	find a file within your project (same as <CR>) ]]
end
M.telescope = {
  -- 历史记录
  cycle_history_next = "<C-j>",
  cycle_history_prev = "<C-k>",
  -- 上下移动
  move_selection_next = "<C-n>",
  move_selection_previous = "<C-p>",

  close = "<C-c>",
  n_close = "<esc>",

  select_default = "<CR>",
  select_horizontal = "<C-x>",
  select_vertical = "<C-v>",

  preview_scrolling_up = "<C-u>",
  preview_scrolling_down = "<C-d>",

  move_to_top = "H",
  move_to_middle = "M",
  move_to_bottom = "L",

  move_to_top_gg = "gg",
  move_to_bottom_G = "G",
}
M.cmp = {
  select_prev_item = "<C-k>",
  select_next_item = "<C-j>",
  scroll_docs_up = "<C-b>",
  scroll_docs_down = "<C-f>",
  show_complete = "<C-Space>",
  disbale = "<C-y>",
  close = "<C-e>",
  select = "<CR>",
}

M.hop_setup = function()
  nmap("<leader>mm", ":<C-u>HopWord<CR>")
  nmap("<leader>ml", ":<C-u>HopLine<CR>")
  nmap("<leader>mc", ":<C-u>HopChar1<CR>")
  nmap("<leader>ms", ":<C-u>HopChar2<CR>")
end

M.terminal = {
  toggle = [[<c-\>]],
  close = "<esc>",
  quit_insert = "jk",
  up = "<C-k>",
  down = "<C-j>",
  left = "<C-h>",
  right = "<C-l>",
}
M.renamer_setup = function()
  nmap("<leader>rn", '<cmd>lua require("renamer").rename()<cr>')
  map("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>')
end
M.treesitter_setup = function()
  nmap("<A-S-i>", "gg=G")
end
M.trouble_setup = function()
  nmap("<leader>tt", "<cmd>TroubleToggle<cr>")
  nmap("<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
  nmap("<leader>td", "<cmd> TroubleToggle document_diagnostics<cr>")
  nmap("<leader>tq", "<cmd>TroubleToggle quickfix<cr>")
  nmap("gR", "<cmd>TroubleToggle lsp_references<cr>")
end
M.aerial_setup = function()
  nmap("<leader>o", "<cmd>AerialToggle<cr>")
end

M.undotree_setup = function()
  nmap("<leader>ud", "<cmd>UndotreeToggle<cr>")
end

M.gotopreview_setup = function()
  nmap("<leader>gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>")
  nmap("<leader>gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>")
  nmap("<leader>gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>")
  nmap("<leader>gpc", "<cmd>lua require('goto-preview').close_all_win()<cr>")
  nmap("<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>")
end

return M
