-- Tokyonight
local tokyonight = {
	style = "night",
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
}

-- One Dark
local onedark = {
	style = "darker",
	term_colors = true,
	code_style = {
		comments = "italic",
		keywords = "italic",
		functions = "none",
		strings = "none",
		variables = "none",
	},
	diagnostics = {
		darker = true,
		undercurl = true,
		background = false,
	},
	transparent = {
		lualine = true,
		tabline = true,
		statusline = true,
	},
}

-- One Dark Pro
local onedark_pro = {
	styles = {
		comments = "italic",
		keywords = "italic",
		constants = "bold",
		conditionals = "italic",
		parameters = "italic",
	},
}

-- Gruvbox
local gruvbox = {
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		comments = true,
		operators = false,
		folds = false,
		keywords = true,
	},
	strikethrough = true,
	invert_selection = false,
}

-- Kanagawa
local kanagawa = {
	commentStyle = { italic = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = { italic = true },
	theme = "dragon",
	background = {
		dark = "dragon",
		light = "lotus",
	},
}

-- Catppuccin
local catppuccin = {
	flavour = "macchiato",
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		keywords = { "italic" },
		booleans = { "bold" },
		types = { "bold" },
	},
	integrations = {
		barbar = true,
		noice = true,
		mason = true,
	},
}

local function get_theme_opts(id)
	if id == 1 then
		return tokyonight
	elseif id == 2 then
		return onedark
	elseif id == 3 then
		return onedark_pro
	elseif id == 4 then
		return gruvbox
	elseif id == 5 then
		return kanagawa
	elseif id == 6 then
		return catppuccin
	end
end

return {
	get_theme_opts = get_theme_opts,
}
