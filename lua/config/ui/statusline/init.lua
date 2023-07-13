local utils = require("heirline.utils")
local colors = require("onedark.colors")

local ViMode = require("config.ui.statusline.vimode")
local FileNameBlock = require("config.ui.statusline.filenameblock")
local Git = require("config.ui.statusline.git")
local Diagnostics = require("config.ui.statusline.diagnostics")
local FileType = require("config.ui.statusline.filetype")
local LspActive = require("config.ui.statusline.lspactive")
local PythonEnv = require("config.ui.statusline.pythonenv")

local Align = { provider = "%=" }
local Space = { provider = " " }
local Seperator = { provider = " | " }

local Ruler = {
	-- %l = current line number
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	Space,
	{ provider = "%l:%2c %P", hl = { bg = colors.red, fg = colors.bg2, bold = true } },
}

local ScrollBar = {
	static = {
		sbar = { "🭶", "🭷", "🭸", "🭹", "🭺", "🭻" },
	},
	{
		provider = function(self)
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			local lines = vim.api.nvim_buf_line_count(0)
			local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
			return string.rep(self.sbar[i], 2)
		end,
		hl = { fg = utils.get_highlight("Function").fg, bg = utils.get_highlight("Folded").bg },
	},
	Space,
}

local LeftComponent_a = utils.surround({ "", "" }, colors.red, { ViMode })
local LeftComponent_b = utils.surround({ "", "" }, colors.bg2, { FileNameBlock, Git, Diagnostics, Align })

local RightComponent_a = utils.surround({ "", "" }, colors.bg2, { PythonEnv, LspActive, FileType, ScrollBar })
local RightComponent_b = utils.surround({ "", "" }, colors.red, { Ruler })

local Statusline = {
	LeftComponent_a,
	LeftComponent_b,
	RightComponent_a,
	RightComponent_b,
}

return Statusline
