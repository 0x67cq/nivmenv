local M = {}
local get_args = function()
    -- 获取输入命令行参数
    local cmd_args = vim.fn.input('CommandLine Args:')
    local params = {}
    -- 定义分隔符(%s在lua内表示任何空白符号)
    local sep = "%s"
    for param in string.gmatch(cmd_args, "[^%s]+") do
        table.insert(params, param)
    end
    return params
end

function M.setup()
    local dap = require "dap"
    dap.adapters.delve = {
        type = "server",
        port = "49890",
        executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:49890" },
        },
    }
    dap.adapters.go = {
        type = "server",
        port = '8181',
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}",
        },
        {
            type = "delve",
            name = "Debug with Args",
            request = "launch",
            program = "${file}",
            args = get_args,
        },
        {
            type = "delve",
            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}",
        },
        -- works with go.mod packages and sub packages
        {
            type = "delve",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}",
        },
        {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
            -- tell which host and port to connect to
            connect = {
                host = "127.0.0.1",
                port = "8181"
            }
            -- dlv debug -l 127.0.0.1:8181 --headless ./main.go -- subcommand --myflag=xyz
            -- 组合使用 服务器上dlv attach -l 可以在本地调试远端服务器
            -- Call :lua require('dap').continue() to start debugging.
            -- Select the new registered option Attach remote.
        },
    }
end

return M
