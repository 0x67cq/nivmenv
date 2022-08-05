local M = {}

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

function M.common_on_attach(client, bufnr)
  -- require("lsp_signature").on_attach({
	-- 	bind = true,
	-- 	use_lspsaga = false,
	-- 	floating_window = true,
	-- 	fix_pos = true,
	-- 	hint_enable = true,
	-- 	hi_parameter = "Search",
	-- 	handler_opts = { "double" },
	-- })
	-- require("aerial").on_attach(client)
  lsp_highlight_document(client)
  require("core.keymaps").lspconfig_setup()
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

return M
