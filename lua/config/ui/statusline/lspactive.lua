local Seperator = { provider = " | " }
local conditions = require("heirline.conditions")

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

return LspActive
