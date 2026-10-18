---@type LazySpec
return {
    {
        "mrcjkb/haskell-snippets.nvim",
        ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
        dependencies = { "L3MON4D3/LuaSnip" },
        config = function()
            local haskell_snippets = require("haskell-snippets").all
            require("luasnip").add_snippets("haskell", haskell_snippets, { key = "haskell" })
        end,
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = { "mrcjkb/neotest-haskell", config = function() end },
        opts = function(_, opts)
            if not opts.adapters then opts.adapters = {} end
            table.insert(opts.adapters, require "neotest-haskell"(require("astrocore").plugin_opts "neotest-haskell"))
        end,
    },
    {
        "mrcjkb/haskell-tools.nvim",
        ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
        dependencies = {
            { "nvim-telescope/telescope.nvim", optional = true },
            { "mfussenegger/nvim-dap", optional = true },
            {
                "AstroNvim/astrolsp",
                ---@type AstroLSPOpts
                opts = {
                    ---@diagnostic disable: missing-fields
                    handlers = { hls = false },
                },
            },
        },
        version = "^4",
        init = function()
            vim.g.haskell_tools = require("astrocore").extend_tbl({
                hls = {
                    capabilities = vim.tbl_get(vim.lsp.config["*"] or {}, "capabilities"),
                },
            }, vim.g.haskell_tools)
        end,
    },
}
