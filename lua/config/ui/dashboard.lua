local dashboard = require("alpha.themes.dashboard")
local config_path = vim.fn.stdpath("config")
local logo = [[
	 /$$   /$$                            /$$$$$$    /$$                     /$$ /$$
	| $$$ | $$                           /$$__  $$  | $$                    | $$|__/
	| $$$$| $$  /$$$$$$   /$$$$$$       | $$  \__/ /$$$$$$   /$$   /$$  /$$$$$$$ /$$  /$$$$$$
	| $$ $$ $$ /$$__  $$ /$$__  $$      |  $$$$$$ |_  $$_/  | $$  | $$ /$$__  $$| $$ /$$__  $$
	| $$  $$$$| $$$$$$$$| $$  \ $$       \____  $$  | $$    | $$  | $$| $$  | $$| $$| $$  \ $$
	| $$\  $$$| $$_____/| $$  | $$       /$$  \ $$  | $$ /$$| $$  | $$| $$  | $$| $$| $$  | $$
	| $$ \  $$|  $$$$$$$|  $$$$$$/      |  $$$$$$/  |  $$$$/|  $$$$$$/|  $$$$$$$| $$|  $$$$$$/
	|__/  \__/ \_______/ \______/        \______/    \___/   \______/  \_______/|__/ \______/
]]

dashboard.section.header.val = vim.split(logo, "\n")

dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("p", "󰃀 " .. " Open Projects", ":Telescope project <CR>"),
	dashboard.button("c", " " .. " Config", ":e $MYVIMRC | cd " .. config_path .. "<CR>"),
	dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load({last = true}) <cr>]]),
	dashboard.button("l", "⚡" .. " Lazy", ":Lazy<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
	button.opts.hl = "AlphaButtons"
	button.opts.hl_shortcut = "AlphaShortcut"
end

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.layout[1].val = 8

return dashboard
