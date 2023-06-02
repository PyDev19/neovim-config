-- Set leader button to space key
vim.g.mapleader = " "

-- Set indentation settings
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Enable 'nowrap' option
vim.opt.wrap = false

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Set line number options
vim.wo.number = true
vim.wo.relativenumber = false
