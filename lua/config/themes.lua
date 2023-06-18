-- One Dark
require("onedark").setup({
	style = "darker",
	term_colors = true,
	code_style = {
		comments = 'italic',
		keywords = 'italic',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	},
	diagnostics = {
		darker = true,
		undercurl = true,
		background = false,
	},
	lualine = {
		transparent = true,
	},
})
