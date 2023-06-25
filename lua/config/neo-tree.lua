local options = {
	auto_clean_after_session_restore = true,
	close_if_last_window = true,
	sources = { "filesystem", "buffers", "git_status" },
	source_selector = {
		winbar = true,
		content_layout = "center",
		sources = {
			{ source = "filesystem",  display_name = "" .. "File" },
			{ source = "buffers",     display_name = "󰈙" .. "Bufs" },
			{ source = "git_status",  display_name = "󰊢" .. "Git" },
			{ source = "diagnostics", display_name = "󰒡" .. "Diagnostic" },
		},
	},
	default_component_configs = {
		indent = { padding = 0 },
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			folder_empty_open = "",
			default = "󰈙",
		},
		modified = { symbol = "" },
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "➜",
				untracked = "★",
				ignored = "◌",
				unstaged = "✗",
				staged = "✓",
				conflict = "",
			},
		},
	},
	window = {
		width = 30,
		mappings = {
			["<S-tab>"] = "prev_source",
			["<tab>"] = "next_source",
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"]  = "git_add_all",
				["u"] = "git_unstage_file",
				["a"] = "git_add_file",
				["r"] = "git_revert_file",
				["c"] = "git_commit",
				["p"] = "git_push",
				["gg"] = "git_commit_and_push",
			}
		}
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
}

return options
