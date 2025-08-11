local vim = _G.vim

-- Ignore LazyVim theme loading
return {
    "sainnhe/gruvbox-material",
    lazy = false,
    name = "gruvbox-material",
    config = function()
        -- gruvbox material theme
        vim.g.gruvbox_material_background = "soft" -- hard, soft, medium
        vim.g.gruvbox_material_foreground = "material" -- original, mix, material
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_colors_override = {
            bg0 = {
                "#32302F",
                "236",
            },
        }

        vim.cmd.colorscheme("gruvbox-material")
    end,
    priority = 1000,
}
