-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local vim = _G.vim
local map = vim.keymap.set

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", {
    desc = "Quit All",
})
