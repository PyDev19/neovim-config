local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local Align = { provider = "%=" }
local Space = { provider = " " }

local ViMode = require("config.statusline.vimode")
local FileNameBlock = require("config.statusline.filenameblock")
local Git = require("config.statusline.git")
local Diagnostics = require("config.statusline.diagnostics")

local Ruler = {
	-- %l = current line number
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	provider = "%7(%l/%3L%):%2c %P",
}

local ScrollBar = {
	static = {
		sbar = { "🭶", "🭷", "🭸", "🭹", "🭺", "🭻" },
	},
	provider = function(self)
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
		return string.rep(self.sbar[i], 2)
	end,
	hl = { fg = utils.get_highlight("Function").fg, bg = utils.get_highlight("Folded").bg },
}

local LspActive = {
	condition = conditions.lsp_attached,
	update = {
		"LspAttach",
		"LspDetach",
	},

	-- You can keep it simple,
	-- provider = " [LSP]",

	-- Or complicate things a bit and get the servers names
	provider = function()
		local names = {}
		for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			table.insert(names, server.name)
	end
		return " [" .. table.concat(names, " ") .. "]"
	end,
	hl = { fg = "green", bold = true },
	on_click = {
		name = "heirline_lsp",
		callback = function()
			vim.defer_fn(function()
				vim.cmd.LspInfo()
			end, 100)
		end,
	},
}

local Statusline = {
	ViMode,
	Space,
	FileNameBlock,
	Space,
	Git,
	Space,
	Diagnostics,
	Align,
	LspActive,
	Space,
	Ruler,
	Space,
	ScrollBar,
}

return Statusline
