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

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- disable line numbers in terminal
vim.cmd([[autocmd TermOpen * setlocal nonumber]])

-- set vim to use system clipboard
vim.cmd([[set clipboard+=unnamedplus]])

-- Disable statusline in alpha
vim.cmd([[
augroup AutoCmds
  autocmd!
  autocmd FileType alpha set laststatus=1
  autocmd FileType * if &filetype != 'alpha' | set laststatus=3 | endif
augroup END
]])


-- set global statusline
vim.o.laststatus = 3
