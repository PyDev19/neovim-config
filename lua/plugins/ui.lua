-- ui related plugin
local plugins = {
	{
		"DaikyXendo/nvim-material-icon",
		config = function()
			require("nvim-material-icon").setup({
				color_icons = true,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		cmd = { "Telescope" },
		ft = { "mason" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		config = function()
			local options = require("config.ui.telescope")
			require("telescope").setup(options)
			require("telescope").load_extension("project")
			require("telescope").load_extension("noice")
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = {
					default_prompt = "➤ ",
					win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" },
				},
				select = {
					backend = { "telescope", "builtin" },
					builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
				},
			})
		end,
	},
	{
		"willothy/nvim-cokeline",
		event = "VeryLazy",
		dependencies = {
			"DaikyXendo/nvim-material-icon",
		},
		config = function()
			local options = require("config.ui.cokeline")
			require("cokeline").setup(options)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "v2.x",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			local options = require("config.ui.neo-tree")
			require("neo-tree").setup(options)
		end,
	},
	{
		"rebelot/heirline.nvim",
		event = "BufRead",
		config = function()
			require("config.ui.heirline")
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
			local options = require("config.ui.noice")
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
					{
						text = { "%s" },
						click = "v:lua.ScSa",
					},
					{
						text = { builtin.lnumfunc, " " },
						click = "v:lua.ScLa",
					},
					{
						text = { builtin.foldfunc },
						click = "v:lua.ScFa",
					},
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "BufRead",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			local options = require("config.ui.nvim_ufo")
			require("ufo").setup(options)
			vim.cmd([[hi Folded guibg=NONE]])
		end,
	},
	{
		"NvChad/nvterm",
		version = "*",
		lazy = true,
		config = function()
			local options = require("config.ui.nvterm")
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
			local dashboard = require("config.ui.dashboard")
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
