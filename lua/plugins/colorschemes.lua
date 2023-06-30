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
		--lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(2)
			require("onedark").setup(options)
			require("onedark").load()
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(3)
			require("onedarkpro").setup(options)
			--require("onedarkpro").load()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(4)
			require("gruvbox").setup(options)
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			local options = require("config.themes").get_theme_opts(5)
			require("kanagawa").setup(options)
		end,
	},
	{
		"catppuccin/nvim",
		lazy=true,
		name = "catppuccin",
		config = function ()
			local options = require("config.themes").get_theme_opts(6)
			require("catppuccin").setup(options)
			require("catppuccin").load()
		end
	},
}

return plugins
