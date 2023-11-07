return {
  -- Themes
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    name = "gruvbox-material",
  },
  {
    'luisiacc/gruvbox-baby',
    priority = 1000,
    name = "gruvbox-baby",
  },

  -- Lazyvim!
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },

  -- default mason options
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "ansible-lint")
      table.insert(opts.ensure_installed, "ansible-language-server")
      table.insert(opts.ensure_installed, "astro-language-server")
      table.insert(opts.ensure_installed, "lua-language-server")
      table.insert(opts.ensure_installed, "markdownlint-cli2")
      table.insert(opts.ensure_installed, "prettierd")
      table.insert(opts.ensure_installed, "typescript-language-server")
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