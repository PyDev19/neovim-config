local highlights = require("neo-tree.ui.highlights")

local options = {
	auto_clean_after_session_restore = true,
	close_if_last_window = true,
	sources = { "filesystem", "git_status", "document_symbols" },
	source_selector = {
		winbar = true,
		content_layout = "center",
		sources = {
			{ source = "filesystem", display_name = "" .. " File" },
			{ source = "git_status", display_name = "󰊢" .. " Git" },
			{ source = "document_symbols", display_name = "" .. " Symbols" },
		},
	},
	default_component_configs = {
		indent = { padding = 0 },
		icon = {
			folder_closed = " ",
			folder_open = " ",
			folder_empty = " ",
			folder_empty_open = " ",
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
			["<CR>"] = "toggle_node",
			["a"] = {
				"add",
				config = {
					show_path = "relative",
				},
			},
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"] = "git_add_all",
				["u"] = "git_unstage_file",
				["a"] = "git_add_file",
				["r"] = "git_revert_file",
				["c"] = "git_commit",
				["p"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
		},
	},
	filesystem = {
		components = {
			icon = function(config, node, state)
				local icon = config.default or " "
				local padding = config.padding or " "
				local highlight = config.highlight or highlights.FILE_ICON

				if node.type == "directory" then
					highlight = highlights.DIRECTORY_ICON
					if node:is_expanded() then
						icon = config.folder_open or "-"
					else
						icon = config.folder_closed or "+"
					end
				elseif node.type == "file" then
					local success, material_icons = pcall(require, "nvim-material-icon")
					if success then
						local devicon, hl = material_icons.get_icon(node.name, node.ext)
						icon = devicon or icon
						highlight = hl or highlight
					end
				end

				return {
					text = icon .. padding,
					highlight = highlight,
				}
			end,
		},
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		window = {
			mappings = {
				["<CR>"] = "open",
			},
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
