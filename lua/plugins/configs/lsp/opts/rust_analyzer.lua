local common_on_attach = require("plugins.configs.lsp.utils").common_on_attach

return {
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false

        common_on_attach(client, bufnr)
    end,
}
