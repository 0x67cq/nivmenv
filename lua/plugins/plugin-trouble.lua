return {
    -- 错误quickfix展示栏
    {
        "folke/trouble.nvim",
        init = function()
            require("configs.coding.trouble")
        end,
        -- require("core.keymaps").trouble_setup()
    },
}
