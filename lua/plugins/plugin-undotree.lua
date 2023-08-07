return {
    {
        "mbbill/undotree",
        init = function()
            vim.keymap.set("n", "<leader>ud", "<cmd>UndotreeToggle<cr>")
        end,
    },
}
