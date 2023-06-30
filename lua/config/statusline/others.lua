local utils = require("heirline.utils")
local Seperator = { provider = " | " }

local FileType = {
	{
		provider = function()
			return vim.bo.filetype
		end,
		hl = { fg = utils.get_highlight("Type").fg, bold = true },
	},
	Seperator,
}

return FileType
