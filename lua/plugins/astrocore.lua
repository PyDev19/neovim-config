-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true, -- highlight URLs at start
            notifications = true, -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key>
                relativenumber = false, -- sets vim.opt.relativenumber
                number = true, -- sets vim.opt.number
                spell = false, -- sets vim.opt.spell
                signcolumn = "yes", -- sets vim.opt.signcolumn to yes
                wrap = false, -- sets vim.opt.wrap
                showtabline = 0,
            },
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
            o = {
                tabstop = 4,
                expandtab = true,
                softtabstop = 4,
                shiftwidth = 4,
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map

                -- navigate buffer tabs
                ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
                ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

                -- mappings seen under group name "Buffer"
                ["<Leader>bd"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr) require("astrocore.buffer").close(bufnr) end
                        )
                    end,
                    desc = "Close buffer from tabline",
                },

                ["<C-z>"] = { "u", desc = "Undo" },
                ["<C-y>"] = { "<C-r>", desc = "Redo" },
                ["<C-a>"] = { "ggVG", desc = "Select All" },

                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                -- ["<Leader>b"] = { desc = "Buffers" },

                -- setting a mapping to false will disable it
                -- ["<C-S>"] = false,
            },
            i = {
                ["<C-z>"] = { "<ESC>ui", desc = "Undo (Insert Mode)" },
                ["<C-y>"] = { "<ESC><C-r>i", desc = "Redo (Insert Mode)" },
                ["<C-s>"] = { "<ESC>:w<CR>", desc = "Save (Insert Mode)" },
                ["<C-a>"] = { "<ESC>ggVG", desc = "Select All (Insert Mode)" },
                ["<S-Tab>"] = { "<C-d>", desc = "Shift Tab" },
                ["<C-c>"] = { "<ESC>yyi", desc = "Copy Line" },
                ["<C-v>"] = { "<C-r>+", desc = "Paste" },
                ["<C-x>"] = { "<ESC>ddi", desc = "Cut" },
            },
            t = {
                ["<C-ESC>"] = { "<C-\\><C-n>", desc = "Escape terminal mode" },
            },
            v = {
                ["<C-c>"] = { "y", desc = "Copy (Visual Mode)" },
                ["<C-x>"] = { "d", desc = "Cut (Visual Mode)" },
                ["<S-up>"] = { ":m '<-2<CR>gv=gv", desc = "Move block up" },
                ["<S-down>"] = { ":m '>+1<CR>gv=gv", desc = "Move block down" },
            },
        },
    },
}
