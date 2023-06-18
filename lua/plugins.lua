local filetypes = { "python", "json", "lua", "sh", "text", "markdown", "cpp", "cmake", "make" }
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Dependencies
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons")

	-- Themes
	use("folke/tokyonight.nvim")
	use({
		"navarasu/onedark.nvim",
		config = function ()
			require("config.themes")
			require("onedark").load()
		end
	})

	-- Dashboard/welcome screen
	use({
  		'glepnir/dashboard-nvim',
  		event = 'VimEnter',
  		config = function()
    		local options = require("config.dashboard")
			require("dashboard").setup(options)
  		end,
	})

	-- Git Signes
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function ()
			require('gitsigns').setup()
		end
	})

	-- lsp and completion
	use({
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/nvim-cmp",
	})

	-- bufferline for tabs for open buffers
	use({
		"romgrk/barbar.nvim",
		config = function()
			local options = require("config.tabbar")
			require("barbar").setup(options)
		end,
	})

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
		end,
	})

	-- Winbar for document symbols
	use({
		"utilyre/barbecue.nvim",
		after = "nvim-navic",
		tag = "*",
		requires = {
			{
				"SmiteshP/nvim-navic",
				event = "BufRead",
			},
		},
		config = function()
			require("barbecue").setup({
				exclude_filetypes = { "netrw", "toggleterm", "NvimTree", "" },
			})
		end,
	})

	-- status column for code folding arrows
	use({
		"luukvbaal/statuscol.nvim",
		event = "BufRead",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				},
			})
		end,
	})

	-- Code folding
	use({
		"kevinhwang91/promise-async",
		after = "nvim-treesitter",
	})
	use({
		"kevinhwang91/nvim-ufo",
		after = "promise-async",
		config = function()
			local options = require("config.nvim_ufo")
			require("ufo").setup(options)
			vim.cmd([[hi Folded guibg=NONE]])
		end,
	})

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- NvTerm for floating, horizontal, and vertical terminals
	use({
		"NvChad/nvterm",
		tag = "*",
		event = "BufReadPre",
		config = function()
			local options = require("config.nvterm")
			require("nvterm").setup(options)
		end,
	})

	-- Linting and Formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function()
			require("config.null_ls")
		end,
	})

	-- Syntax Highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		ft = filetypes,
		config = function()
			local options = require("config.treesitter")
			require("nvim-treesitter.configs").setup(options)
		end,
	})

	-- Automatically indent blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
		ft = filetypes,
		config = function()
			local options = require("config.indent_blankline")
			require("indent_blankline").setup(options)
		end,
	})

	-- For commenting mulitple lines at the same time
	use({
		"numToStr/Comment.nvim",
		ft = filetypes,
		config = function()
			require("Comment").setup()
		end,
	})

	-- Auto pairing for curly braces, brackets, parenthesis, etc..
	use({
		"windwp/nvim-autopairs",
		ft = filetypes,
		config = function()
			require("nvim-autopairs").setup({
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	})

	-- File Tree
	use({
		"nvim-tree/nvim-tree.lua",
		opt = true,
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },

		config = function()
			local options = require("config.nvimtree")
			require("nvim-tree").setup(options)
		end,
	})

	-- Telescope for alot of stuff
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
