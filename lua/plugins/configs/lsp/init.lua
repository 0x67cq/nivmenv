local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  sumneko_lua = require "plugins.configs.lsp.opts.sumneko_lua",
  tsserver = require "plugins.configs.lsp.opts.tsserver",
  jsonls = require "plugins.configs.lsp.opts.jsonls",
  rust_analyzer = require "plugins.configs.lsp.opts.rust_analyzer",
  gopls = "",
  yamlls = "",
  cssls = "",
  -- html = "",
  tailwindcss = "",
  eslint = "",
  clangd = "",
}

-- 自动安装 Language Servers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      vim.notify("Installing " .. name)
      server:install()
    end
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local common_on_attach = require("plugins.configs.lsp.utils").common_on_attach

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    flags = { debounce_text_changes = 500 },
    on_attach = common_on_attach,
  }
  local config = servers[server.name]
  if config ~= "" then
    opts = vim.tbl_deep_extend("keep", config, opts)
  end
  server:setup(opts)
end)

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
  -- { name = "DiagnosticSignError", text = "" },
  -- { name = "DiagnosticSignWarn", text = "" },
  -- { name = "DiagnosticSignHint", text = "" },
  -- { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    format = function(d)
      local t = vim.deepcopy(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)
      if code then
        t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
      end
      return t.message
    end,
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

require "plugins.configs.lsp.null-ls"
-- require("plugins.configs.lsp.efm").setup(common_on_attach, capabilities)
