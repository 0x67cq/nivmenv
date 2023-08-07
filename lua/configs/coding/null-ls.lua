local M={}

function M.setup()
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
	    return
    end
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.shfmt, -- shell script formatting
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.goimports_reviser
  },
    -- 保存自动格式化
    on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
        end
    end,
})
end

return M
