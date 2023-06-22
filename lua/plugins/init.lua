local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local colorschemes = require("plugins.colorschemes")
local lsp = require("plugins.lsp")
local ui = require("plugins.ui")
local editor = require("plugins.editor")

local plugins = {}

-- Load plugins from colorschemes table
for _, plugin in ipairs(colorschemes) do
	table.insert(plugins, plugin)
end

-- Load plugins from lsp table
for _, plugin in ipairs(lsp) do
	table.insert(plugins, plugin)
end

-- Load plugins from ui table
for _, plugin in ipairs(ui) do
	table.insert(plugins, plugin)
end

-- Load plugins from editor table
for _, plugin in ipairs(editor) do
	table.insert(plugins, plugin)
end

require("lazy").setup(plugins)
