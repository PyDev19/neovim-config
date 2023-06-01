vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Normally loaded
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons")
	use({
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/nvim-cmp",
	})
	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	})
	use({
		"romgrk/barbar.nvim",
		config = function()
			local options = require("config.tabbar")
			require("barbar").setup(options)
		end,
	})

	-- Lazy load
	-- Load when file type gets opened
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		event = "BufReadPre",
		config = function()
			require('toggleterm').setup()
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function()
			require("config.null_ls")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		ft = { "python", "json", "lua", "sh", "text", "markdown" },
		config = function()
			local options = require("config.treesitter")
			require("nvim-treesitter.configs").setup(options)
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		ft = { "python", "json", "lua", "sh", "text", "markdown" },
		config = function()
			local options = require("config.indent_blankline")
			require("indent_blankline").setup(options)
		end,
	})
	use({
		"numToStr/Comment.nvim",
		ft = { "python", "json", "lua", "sh", "text", "markdown" },
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		ft = { "python", "json", "lua", "sh", "text", "markdown" },
		config = function()
			require("nvim-autopairs").setup({
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	})

	-- Load when a command is run
	use({
		"nvim-tree/nvim-tree.lua",
		opt = true,
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },

		config = function()
			local options = require("config.nvimtree")
			require("nvim-tree").setup(options)
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		opt = true,
		cmd = "Telescope",
		tag = "0.1.1",
		config = function()
			local options = require("config.telescope")
			require("telescope").setup(options)
		end,
	})
end)
