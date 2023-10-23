return {
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    name = "gruvbox-material",
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },

  -- Add Prettierd
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
      table.insert(opts.ensure_installed, "ansible-language-server")
    end,
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
