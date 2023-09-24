-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Global
vim.o.foldnestmax = 4
vim.o.foldlevel = 1
vim.o.foldcolumn = "1"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldmethod = "expr"
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.showtabline = 2
vim.opt.mouse = "a"
vim.opt.backupcopy = "yes"
vim.opt.undolevels = 1000
vim.opt.shortmess:append({ c = true, S = true })
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrapscan = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.joinspaces = false
vim.opt.title = true
vim.opt.encoding = "UTF-8"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.timeoutlen = 500
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
end

-- Window
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.colorcolumn = "+1"
vim.opt.list = true
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true

-- Theme
vim.g.gruvbox_baby_transparent_mode = true
