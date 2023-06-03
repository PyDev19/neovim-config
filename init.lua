require("plugins")
require("settings")
require("mappings")
require("config.completion")
require("config.lsp")

-- for neovide
if vim.g.neovide then
	vim.o.guifont = "JetBrains Mono Regular:h11"
	vim.g.neovide_cursor_animation_length = 0
	vim.cmd([[
		autocmd VimEnter * silent! lcd %:p:h
	]])
end
