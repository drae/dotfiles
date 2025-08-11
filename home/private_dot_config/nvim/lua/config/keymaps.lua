-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local vim, LazyVim = _G.vim, _G.LazyVim
local map = vim.keymap.set

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", {
    desc = "Quit All",
})

-- formatting
map({ "n", "v" }, "<leader>cf", function()
    LazyVim.format({ force = true })
end, {
    desc = "Format",
})
