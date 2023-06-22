-- ui related plugin
local plugins = {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		config = function()
			local options = require("config.telescope")
			require("telescope").setup(options)
			require("telescope").load_extension("project")
			require("telescope").load_extension("noice")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local options = require("config.nvimtree")
			require("nvim-tree").setup(options)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				theme = "auto",
			})
		end,
	},
	{
		"romgrk/barbar.nvim",
		event = "VeryLazy",
		config = function()
			local options = require("config.tabbar")
			require("barbar").setup(options)
		end,
	},
	{
		"utilyre/barbecue.nvim",
		version = "*",
		event = "BufRead",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		config = function()
			require("barbecue").setup({
				exclude_filetypes = { "netrw", "toggleterm", "NvimTree", "" },	
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			local options = require("config.noice")
			require("noice").setup(options)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		event = "BufRead",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
					{ text = { "%s" },                  click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "BufRead",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			local options = require("config.nvim_ufo")
			require("ufo").setup(options)
			vim.cmd([[hi Folded guibg=NONE]])
		end,
	},
	{
		"NvChad/nvterm",
		version = "*",
		lazy = true,
		config = function()
			local options = require("config.nvterm")
			require("nvterm").setup(options)
		end,
	},
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local dashboard = require("config.dashboard")
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
}

return plugins
