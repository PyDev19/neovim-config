local plugins = {
    {
		"mg979/vim-visual-multi",
		event = "BufRead",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "InsertEnter",
		config = function()
			local options = require("config.others.indent_blankline")
			require("indent_blankline").setup(options)
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
}

return plugins
