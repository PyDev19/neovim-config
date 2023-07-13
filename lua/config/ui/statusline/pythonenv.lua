local Seperator = { provider = " | " }

local PythonEnv = {
	condition = function()
		return vim.bo.filetype == "python"
	end,
	{
		provider = function()
			local venv_name = require("venv-selector").get_active_venv()
			if venv_name == nil then
				return "python: system"
			else
				local folder_names = {}
				for folder_name in venv_name:gmatch("[^/]+") do
					table.insert(folder_names, folder_name)
				end

				local venv_name = table.concat(folder_names, "/", #folder_names - 1, #folder_names)

				if #folder_names <= 2 then
					venv_name = table.concat(folder_names, "/")
				end
				return "python: " .. venv_name
			end
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
