return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            -- require('lualine').setup()
            require('configs.editor.lualine')
        end
    }
}
