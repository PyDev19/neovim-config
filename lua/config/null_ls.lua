local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	lint.selene,
	lint.flake8.with({ extra_args = { "--max-line-length", "500" } }),
	lint.markdownlint,
	formatting.stylua,
	formatting.black.with({ extra_args = { "--line-length=120" } }),
	formatting.prettier,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
