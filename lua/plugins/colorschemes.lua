-- colorscheme related plugins
local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			local options = require("config.others.themes").get_theme_opts(1)
			require("tokyonight").setup(options)
		end,
	},
	{
		"navarasu/onedark.nvim",
		--lazy = true,
		config = function()
			local options = require("config.others.themes").get_theme_opts(2)
			require("onedark").setup(options)
			require("onedark").load()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		config = function()
			local options = require("config.others.themes").get_theme_opts(3)
			require("gruvbox").setup(options)
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			local options = require("config.others.themes").get_theme_opts(4)
			require("kanagawa").setup(options)
		end,
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		config = function()
			local options = require("config.others.themes").get_theme_opts(5)
			require("catppuccin").setup(options)
			require("catppuccin").load()
		end,
	},
}

return plugins
