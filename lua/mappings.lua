local map = vim.api.nvim_set_keymap

local options = { noremap = true, silent = true }

-- Define a function to toggle the terminal
function toggle_terminal()
	require("nvterm.terminal").toggle("float")
end

-- Normal Mode Keybinds
-- Git
map("n", "<leader>g", ":Telescope git_status<CR>", options)
map("n", "<leader>gb", ":Telescope git_branches<CR>", options)
map("n", "<leader>gc", ":Telescope git_commits<CR>", options)
map("n", "<leader>gf", ":Telescope git_files<CR>", options)
map("n", "<C-p>", ":Telescope find_files<CR>", options)
map("n", "<esc>", ":noh<CR>", options)
map("n", "<C-s>", ":w!<CR>", options)
map("n", "<C-z>", "u<CR>", options)
map("n", "<C-y>", "<C-r><CR>", options)
map("n", "<leader>th", ":Telescope colorscheme<CR>", options)
map("n", "<C-a>", "ggVG<CR>", options)
map("n", "<C-n>", ":NvimTreeToggle<CR>", options)
map("n", "<C-f>", ":/", { noremap = true })
map("n", "<leader>fr", ":%s@find@replace@gc", { noremap = true })
map("n", "<leader>e", ":NvimTreeFocus<CR>", options)
map("n", "<C-w>", ":BufferClose<CR>", options)
map("n", "<A-w>", ":BufferRestor<CR>", options)
map("n", "<leader>fm", ":lua vim.lsp.buf.format({ async = true }) print('formatted')<CR>", options)
map("n", "<C-t>", ":lua toggle_terminal()<CR>", options)
map("n", "<tab>", ":BufferNext<CR>", options)

-- Insert Mode Keybinds
map("i", "<C-z>", "<C-o>u", options)
map("i", "<C-y>", "<C-o><C-r>", options)
map("i", "<C-p>", "<C-o>:Telescope find_files<CR>", options)
map("i", "<A-p>", "<C-o>:", { noremap = true })
map("i", "<C-s>", "<C-o>:w!<CR>", options)
map("i", "<S-tab>", "<C-d>", options)
map("i", "<C-n>", "<C-o>:NvimTreeToggle<CR>", options)
map("i", "<C-e>", "<esc>:NvimTreeFocus<CR>", options)
map("i", "<C-w>", "<C-o>:BufferClose<CR>", options)
map("i", "<A-w>", "<C-o>:BufferRestore<CR>", options)
map("i", "<C-f>", "<C-o>:/", { noremap = true })
map("i", "<C-t>", "<C-o>:lua toggle_terminal()<CR>", options)

-- Visual Mode
map("v", "<S-Up>", ":m '<-2<CR>gv=gv", options)
map("v", "<S-Down>", ":m '>+1<CR>gv=gv", options)
map("v", "<tab>", ">", options)
map("v", "<S-tab>", "<", options)
map("v", "<C-/>", "gc", options)

-- Terminal
map("t", "<C-t>", "<C-\\><C-n>:lua toggle_terminal()<CR>", options)
