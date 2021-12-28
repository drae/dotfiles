vim.g.gruvbox_flat_style = "dark"

vim.cmd [[
try
  colorscheme gruvbox-flat
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
