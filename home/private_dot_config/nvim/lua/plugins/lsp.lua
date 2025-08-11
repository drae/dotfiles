-- Mason

return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "ansible-lint",
            "ansible-language-server",
            "astro-language-server",
            "lua-language-server",
            "markdownlint-cli2",
            "prettierd",
            "shellcheck",
            "stylua",
            "typescript-language-server",
        },
    },
}
