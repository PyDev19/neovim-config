local filetypes = { "python", "json", "lua", "sh", "text", "markdown", "cpp", "cmake", "make" }
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
	-- use({
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		vim.cmd("colorscheme tokyonight-night")
	-- 	end,
	-- })
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			require("onedark").load()
		end,
	})
	use({
		"romgrk/barbar.nvim",
		config = function()
			local options = require("config.tabbar")
			require("barbar").setup(options)
		end,
	})
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

	-- Lazy load
	-- Load when file type gets opened
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
			require("barbecue").setup()
		end,
	})
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
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	use({
		"NvChad/nvterm",
		tag = "*",
		event = "BufReadPre",
		config = function()
			local options = require("config.nvterm")
			require("nvterm").setup(options)
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
		ft = filetypes,
		config = function()
			local options = require("config.treesitter")
			require("nvim-treesitter.configs").setup(options)
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		ft = filetypes,
		config = function()
			local options = require("config.indent_blankline")
			require("indent_blankline").setup(options)
		end,
	})
	use({
		"numToStr/Comment.nvim",
		ft = filetypes,
		config = function()
			require("Comment").setup()
		end,
	})
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
