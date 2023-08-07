local M = {}
function M.setup()
    local dap = require "dap"
    dap.adapters.codelldb = {
        type = "server",
        host = "127.0.0.1",
        port = 49099, -- 💀 Use the port printed out or specified with `--port`
    }

    dap.adapters.codelldb = {
        type = "server",
        port = "49099",
        executable = {
            command = "/usr/local/codelldb/extension/adapter/codelldb",
            args = { "--port", "49099" },

            -- On windows you may have to uncomment this:
            -- detached = false,
        },
    }
    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true,
        },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

return M
