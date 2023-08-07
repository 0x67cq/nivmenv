local utils = require("core.utils")

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
end

return M
