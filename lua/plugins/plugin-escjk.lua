return {
    -- 控制 jk->esc 连按判定间隔速度
    {
        "jdhao/better-escape.vim",
        lazy = true,
        event = "InsertEnter",
        init = function()
            vim.cmd("let g:better_escape_shortcut = 'jk'")
            -- set time interval to 200 ms
            vim.cmd("let g:better_escape_interval = 200")
        end,
    },
}
