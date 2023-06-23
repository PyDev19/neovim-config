local options = {
	auto_hide = true,
	clickable = true,
	insert_at_end = true,
	sidebar_filetypes = {
		NvimTree = { text = "       File Explorer" },
	},
	icons = {
		button = "",
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.HINT] = { enabled = true, icon = " " },
		},
		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
	},
}

return options
