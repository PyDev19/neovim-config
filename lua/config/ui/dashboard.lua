local dashboard = require("alpha.themes.dashboard")
local config_path = vim.fn.stdpath("config")
local logo = [[
             /$$   /$$                                
            | $$$ | $$                                
            | $$$$| $$  /$$$$$$   /$$$$$$             
            | $$ $$ $$ /$$__  $$ /$$__  $$            
            | $$  $$$$| $$$$$$$$| $$  \ $$            
            | $$\  $$$| $$_____/| $$  | $$            
            | $$ \  $$|  $$$$$$$|  $$$$$$/            
            |__/  \__/ \_______/ \______/            

  /$$$$$$    /$$                     /$$ /$$          
 /$$__  $$  | $$                    | $$|__/          
| $$  \__/ /$$$$$$   /$$   /$$  /$$$$$$$ /$$  /$$$$$$ 
|  $$$$$$ |_  $$_/  | $$  | $$ /$$__  $$| $$ /$$__  $$
 \____  $$  | $$    | $$  | $$| $$  | $$| $$| $$  \ $$
 /$$  \ $$  | $$ /$$| $$  | $$| $$  | $$| $$| $$  | $$
|  $$$$$$/  |  $$$$/|  $$$$$$/|  $$$$$$$| $$|  $$$$$$/
 \______/    \___/   \______/  \_______/|__/ \______/ 
]]

dashboard.section.header.val = vim.split(logo, "\n")

dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("p", "󰃀 " .. " Open Projects", ":Telescope project <CR>"),
	dashboard.button("c", " " .. " Config", ":e $MYVIMRC | cd " .. config_path .. "<CR>"),
	dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load({last = true}) <cr>]]),
	dashboard.button("l", "󰒲" .. " Lazy", ":Lazy<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
	button.opts.hl = "Function"
	button.opts.hl_shortcut = "Keyword"
end

dashboard.section.header.opts.hl = "Type"
dashboard.section.footer.opts.hl = "Float"
dashboard.opts.layout[1].val = 2

return dashboard
