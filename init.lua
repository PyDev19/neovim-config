require("plugins.init")
require("settings")
require("mappings")

-- for neovide
if vim.g.neovide then
	vim.o.guifont = "JetBrains Mono:h11"
	vim.g.neovide_cursor_animation_length = 0
	vim.cmd("autocmd VimEnter * silent! lcd %:p:h")
end
