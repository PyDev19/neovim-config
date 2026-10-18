-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    -- LSPs
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.python.base" },
    { import = "astrocommunity.pack.python.basedpyright" },
    { import = "astrocommunity.pack.python.ruff" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.cmake" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.json" },

    { import = "astrocommunity.test.neotest" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim" },
    { import = "astrocommunity.media.neocord-nvim" },
    { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
}
