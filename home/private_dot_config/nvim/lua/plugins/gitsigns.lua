return {
    "lewis6991/gitsigns.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        signs_staged_enable = true,
        signcolumn = true,
        numhl = true,
        linehl = true,
        word_diff = true,
        current_line_blame = true,
        watch_gitdir = {
            follow_files = true,
        },
    },
}
