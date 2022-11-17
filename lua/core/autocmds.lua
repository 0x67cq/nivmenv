-- uncomment this if you want to open nvim with a dir
-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
vim.cmd [[ au InsertEnter * set norelativenumber ]]
vim.cmd [[ au InsertLeave * set relativenumber ]]
vim.cmd [[ autocmd WinEnter * if &number | execute("setlocal number relativenumber") | endif ]]
vim.cmd [[ autocmd WinLeave * if &number | execute("setlocal number norelativenumber") | endif ]]

-- Don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- Don't show status line on certain windows
vim.cmd [[ autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require("core.utils").hide_statusline() ]]

-- Nvim-tree auto close
vim.cmd [[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]

-- FIX: Iterm2 光标不闪烁
vim.cmd [[ au VimLeave * set guicursor=a:ver25-blinkon1 ]]

-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
-- File extension specific tabbing
-- vim.cmd [[ autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]
--
vim.cmd [[autocmd! FileType qf nnoremap <buffer> <C-v> <C-w><Enter><C-w>L]]

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
