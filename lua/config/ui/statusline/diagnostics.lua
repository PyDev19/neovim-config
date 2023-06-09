local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local Seperator = { provider = " | " }

local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = {
		hint_icon = "",
		info_icon = "",
		warn_icon = "",
		error_icon = "",
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },
	Seperator,
	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and (self.error_icon .. self.errors .. " ")
		end,
		hl = { fg = utils.get_highlight("DiagnosticError").fg },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
		end,
		hl = { fg = utils.get_highlight("DiagnosticWarn").fg },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. self.info .. " ")
		end,
		hl = { fg = utils.get_highlight("DiagnosticInfo").fg },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. self.hints)
		end,
		hl = { fg = utils.get_highlight("DiagnosticHint").fg },
	},
	on_click = {
		name = "heirline_diagnostics",
		callback = function()
			vim.defer_fn(function()
				vim.cmd("Neotree diagnostics toggle bottom")
			end, 100)
		end,
	},
}

return Diagnostics
