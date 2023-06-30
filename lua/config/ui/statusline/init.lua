local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local colors = require("onedark.palette")

local ViMode = require("config.ui.statusline.vimode")
local FileNameBlock = require("config.ui.statusline.filenameblock")
local Git = require("config.ui.statusline.git")
local Diagnostics = require("config.ui.statusline.diagnostics")
local FileType = require("config.ui.statusline.others")

local Align = { provider = "%=" }
local Space = { provider = " " }
local Seperator = { provider = " | " }

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
	{
		provider = function()
			local names = {}
			for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
				table.insert(names, server.name)
			end
			return table.concat(names, " ")
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
	},
	Seperator,
}

local LeftComponent = utils.surround({ "", "" }, colors.dark.bg2, { ViMode, FileNameBlock, Git, Diagnostics })

local RightComponent = utils.surround(
	{ "", "" },
	colors.dark.bg2,
	{ LspActive, FileType, Ruler, Space, ScrollBar }
)

local Statusline = {
	LeftComponent,
	Align,
	RightComponent,
}

vim.cmd("hi StatusLine guibg=" .. colors.dark.bg0)

return Statusline
