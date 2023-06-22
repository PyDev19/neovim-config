-- colorscheme related plugins
local plugins = {
	{
		"folke/tokyonight.nvim",
		config = function ()
			vim.cmd("colorscheme tokyonight-night")
		end
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("config.themes")
		end,
	},
}

return plugins
