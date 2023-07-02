local colors = require("onedark.colors")

local ModeNames = {
	n = "Normal",
	no = "Normal",
	nov = "Normal",
	noV = "Normal",
	["no\22"] = "Normal",
	niI = "(insert)",
	niR = "(replace)",
	niV = "(visual-replace)",
	nt = "Normal",
	v = "Visual",
	vs = "(visual)",
	V = "Visual Line",
	Vs = "(visual-line)",
	["\22"] = "Visual Block",
	["\22s"] = "(visual-block)",
	s = "Select",
	S = "Select Line",
	["\19"] = "Select Block",
	i = "Insert",
	ic = "Insert",
	ix = "Insert",
	R = "Replace",
	Rc = "Replace",
	Rx = "Replace",
	Rv = "Replace",
	Rvc = "Replace",
	Rvx = "Replace",
	c = "Command",
	cv = "Vim Ex",
	r = "...",
	rm = "M",
	["r?"] = "?",
	["!"] = "External Command",
	t = "Terminal",
}

local ModeColors = {
	n = "red",
	i = "green",
	v = "cyan",
	V = "cyan",
	["\22"] = "cyan",
	c = "orange",
	s = "purple",
	S = "purple",
	["\19"] = "purple",
	R = "orange",
	r = "orange",
	["!"] = "red",
	t = "red",
}

local ViMode = {
	init = function(self)
		self.mode = vim.fn.mode(1) -- :h mode()
	end,
	static = {
		mode_names = ModeNames,
		mode_colors = ModeColors,
	},
	{
		provider = function(self)
			return "%2(" .. self.mode_names[self.mode] .. " %)"
		end,
		-- Same goes for the highlight. Now the foreground will change according to the current mode.
		hl = function(self)
			local mode = self.mode:sub(1, 1) -- get only the first mode character
			return { bg = colors.purple, fg = colors.bg2, bold = true }
		end,
	},
	-- Re-evaluate the component only on ModeChanged event!
	-- Also allows the statusline to be re-evaluated when entering operator-pending mode
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}

return ViMode
