local plugins = {
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-tree-docs",
		},
		config = function()
			local options = require("config.lsp.treesitter")
			require("nvim-treesitter.configs").setup(options)
		end,
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
			-- require("mason-lspconfig").setup({
			-- 	ensure_installed = { "lua_ls", "clangd", "pyright", "cmake" },
			-- })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/nvim-cmp",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("config.lsp.completion")
			require("config.lsp.lsp")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason").setup()
			require("config.lsp.null_ls")
		end,
	},
}

return plugins
