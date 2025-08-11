local vim = _G.vim

--- Autocomplete
return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "FelipeLema/cmp-async-path",
        "rasulomaroff/cmp-bufname",
    },
    opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", {
            link = "Comment",
            default = true,
        })
        local cmp = require("cmp")

        -- autopairs
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

        -- actual cmp config
        local defaults = require("cmp.config.default")()
        local auto_select = true

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                {
                    name = "conventionalcommits",
                },
                {
                    name = "commit",
                },
                {
                    name = "git",
                },
            }, {
                {
                    name = "async_path",
                },
                {
                    name = "buffer",
                },
            }),
        })

        cmp.setup.filetype("org", {
            sources = cmp.config.sources({
                {
                    name = "orgmode",
                },
                {
                    name = "async_path",
                },
                {
                    name = "buffer",
                },
            }),
        })

        return {
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            }, -- REQUIRED to specify snippet engine -- `vim.snippet` for native neovim snippets (Neovim v0.10+)
            sources = cmp.config.sources({
                -- multiple tables is so the first table must have no results
                -- before the second table is shown, etc
                -- TODO: git sources
                {
                    name = "nvim_lsp_signature_help",
                },
                {
                    name = "nvim_lsp",
                },
                {
                    name = "bufname",
                },
                {
                    name = "async_path",
                },
                {
                    name = "fish",
                },
            }, {
                {
                    name = "buffer",
                },
            }),
            completion = {
                completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ", noselect"),
            },
            preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None, -- suggested config
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end,
                ["<C-esc>"] = cmp.mapping.abort(),
                ["<C-c>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText",
                },
            }, -- suggested config
            sorting = defaults.sorting, -- suggested config
        }
    end,
}
