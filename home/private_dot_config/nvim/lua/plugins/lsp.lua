-- Mason

return {
    "mason-org/mason.nvim",
    opts = {
        ensure_installed = {
            -- ansible
            "ansible-language-server",
            "ansible-lint",
            -- astro
            "astro-language-server",
            -- lua
            "lua-language-server",
            "stylua",
            -- markdown
            "markdownlint-cli2",
            -- python
            "pyright",
            "ruff",
            -- shell
            "shellcheck",
            "shfmt",
            -- typescript/javascript (html/css/web/etc.)
            "typescript-language-server",
            "prettierd",
        },
    },
}
