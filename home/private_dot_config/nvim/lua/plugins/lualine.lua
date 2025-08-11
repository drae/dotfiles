return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- override LazyVim configuration
    opts = function()
        return {
            theme = "gruvbox-material",
        }
    end,
}
