require("plugins")
require("settings")
require("mappings")
require("config.completion")
require("config.lsp")

-- Define what theme to use
vim.cmd([[let g:theme="onedark-darker"]])

-- Apply theme
local theme = vim.g.theme

-- if theme is onedark
if string.find(theme, "onedark") then
	local onedark_variant = ""

	local index = 0
	for part in string.gmatch(theme, "([^-]+)") do
		index = index + 1
		if index == 2 then
			onedark_variant = part
		end
	end

	require("onedark").setup({
		style = onedark_variant,
		term_colors = true,
		code_style = {
			comments = 'italic',
			keywords = 'italic',
			functions = 'none',
			strings = 'none',
			variables = 'none'
		},
		diagnostics = {
			darker = true,
			undercurl = true,
			background = false,
		},
		lualine = {
        	transparent = true,
    	},
	})

	require("onedark").load()
else -- if theme is tokyonight
	vim.cmd("colorscheme " .. theme)
end

-- for neovide
if vim.g.neovide then
	vim.o.guifont = "JetBrains Mono:h11"
	vim.g.neovide_cursor_animation_length = 0
	vim.cmd([[
		autocmd VimEnter * silent! lcd %:p:h
	]])
end
