local vim = _G.vim
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- gruvbox material theme
vim.g.gruvbox_material_background = "soft" -- hard, soft, medium
vim.g.gruvbox_material_foreground = "material" -- original, mix, material
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_colors_override = { bg0 = { "#32302F", "236" } }

-- gruvbox baby theme
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"
vim.g.gruvbox_baby_transparent_mode = 1
vim.g.gruvbox_baby_telescope_theme = 1
