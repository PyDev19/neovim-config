local HelpFileName = {
	condition = function()
		return vim.bo.filetype == "help"
	end,
	provider = function()
		local filename = vim.api.nvim_buf_get_name(0)
		return vim.fn.fnamemodify(filename, ":t")
	end,
	hl = { fg = "#8ba4b0" },
}

local TerminalName = {
	-- we could add a condition to check that buftype == 'terminal'
	-- or we could do that later (see #conditional-statuslines below)
	provider = function()
		local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
		return " " .. tname
	end,
	hl = { fg = "blue", bold = true },
}

return Ruler, ScrollBar, LspActive, HelpFileName, TerminalName
