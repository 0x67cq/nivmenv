return {
    -- 自动注释
    {
        "numToStr/Comment.nvim",
        init = function()
            require("configs.coding.comment")
        end,
    },
}
