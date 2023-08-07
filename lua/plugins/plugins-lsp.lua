return {
    -- lsp config
    {
        "neovim/nvim-lspconfig",
        -- init = function() require("configs.coding.lspconfig") end,
    },
    {
        "williamboman/mason.nvim",
        -- init = function() require("configs.coding.mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        init = function()
            require("configs.coding.lsp").setup()
        end,
    },
    -- lsp server 自动化安装
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            require("configs.coding.null-ls").setup()
        end,
    },

    -- 函数参数浮框显示
    {
        "ray-x/lsp_signature.nvim",
        lazy = true,
        init = function()
            require("configs.coding.lsp-signature")
        end,
    },
}
