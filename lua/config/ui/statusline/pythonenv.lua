local Seperator = { provider = " | " }

local PythonEnv = {
	condition = function()
		local venv_name = require("venv-selector").get_active_venv()
		return venv_name ~= nil
	end,
	update = { "DirChanged" },
	{
		provider = function()
			local venv_name = require("venv-selector").get_active_venv()
			return " " .. venv_name
		end,
	},
	on_click = {
		callback = function()
			vim.cmd.VenvSelect()
		end,
		name = "heirline_statusline_venv_selector",
	},
	Seperator,
}

return PythonEnv
