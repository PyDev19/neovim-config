-- colorscheme related plugins
local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(1)
			require("tokyonight").setup(options)
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(2)
			require("onedark").setup(options)
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(3)
			require("onedarkpro").setup(options)
			require("onedarkpro").load()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(4)
			require("gruvbox").setup(options)
			require("gruvbox").load()
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(5)
			require("kanagawa").setup(options)
			require("kanagawa").load()
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function ()
			local options = require("config.themes").get_theme_opts(6)
			require("catppuccin").setup(options)
			require("catppuccin").load()
		end
	},
}

return plugins
