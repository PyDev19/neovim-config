local header = {
	"",
	"",
	"  ███╗   ██╗███████╗ ██████╗  ██████╗ ██████╗ ██████╗ ███████╗",
	"  ████╗  ██║██╔════╝██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝",
	"██╔██╗ ██║█████╗  ██║   ██║██║     ██║   ██║██║  ██║█████╗",
	"██║╚██╗██║██╔══╝  ██║   ██║██║     ██║   ██║██║  ██║██╔══╝",
	"  ██║ ╚████║███████╗╚██████╔╝╚██████╗╚██████╔╝██████╔╝███████╗",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝",
	"",
	"",
}

local options = {
	theme = "hyper",
	shortcut_type = "number",
	change_to_vcs_root = false,
	hide = {
		statusline = false,
		winbar = false,
	},
	config = {
		header = header,
		packages = { enable = false },
		shortcut = {
			{
				icon = "󰊳 ",
				desc = "Update",
				action = "PackerSync",
				key = "u",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Find Files",
				group = "Label",
				action = "Telescope fd",
				key = "f",
			},
			{
				icon = "$",
				desc = "Open Terminal",
				action = "terminal",
				key = "t",
			},
		},
	},
}

return options
