local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Define a function to toggle the terminal
function toggle_terminal()
	require("nvterm.terminal").toggle("float")
end

-- Normal Mode Keybinds
map("n", "<leader>g", ":Telescope git_status<CR>", options) -- Telescope Git Status
map("n", "<leader>gb", ":Telescope git_branches<CR>", options) -- Telescope Git Branches
map("n", "<leader>gc", ":Telescope git_commits<CR>", options) -- Telescope Git Commits
map("n", "<leader>gf", ":Telescope git_files<CR>", options) -- Telescope Git Files
map("n", "<C-p>", ":Telescope find_files<CR>", options) -- Telescope Find Files
map("n", "<leader>th", ":Telescope colorscheme<CR>", options) -- Telescope themes
map("n", "<C-w>", ":BufferClose<CR>", options) -- Close current buffer
map("n", "<A-w>", ":BufferRestor<CR>", options) -- Restore previous buffer
map("n", "<tab>", ":BufferNext<CR>", options) -- Goto next buffer
map("n", "<C-n>", ":NvimTreeToggle<CR>", options) -- Toggle NvimTree
map("n", "<leader>e", ":NvimTreeFocus<CR>", options) -- Focus NvimTree
map("n", "<C-f>", ":/", { noremap = true }) -- Find
map("n", "<leader>fr", ":%s@find@replace@gc", { noremap = true }) -- Find and Replace
map("n", "<leader>fm", ":lua vim.lsp.buf.format({ async = true }) print('formatted')<CR>", options) -- Format Code
map("n", "<esc>", ":noh<CR>", options) -- Clear highlighting
map("n", "<C-s>", ":w!<CR>", options) -- Save
map("n", "<C-z>", "u<CR>", options) -- Undo
map("n", "<C-y>", "<C-r><CR>", options) -- Redo
map("n", "<C-a>", "ggVG<CR>", options) -- Select all
map("n", "<C-t>", ":lua toggle_terminal()<CR>", options) -- Toggle Terminal
map("n", "<C-c>", '"+yy', options) -- Copy to system clipboard
map("n", "<C-v>", '"+p', options) -- Paste to system clipboard

-- Insert Mode Keybinds
map("i", "<C-n>", "<C-o>:NvimTreeToggle<CR>", options) -- Toggle NvimTree
map("i", "<C-e>", "<esc>:NvimTreeFocus<CR>", options) -- Focus NvimTree
map("i", "<C-w>", "<C-o>:BufferClose<CR>", options) -- Close current buffer
map("i", "<A-w>", "<C-o>:BufferRestore<CR>", options) -- Restore last buffer
map("i", "<C-t>", "<C-o>:lua toggle_terminal()<CR>", options) -- toggle terminal
map("i", "<C-z>", "<C-o>u", options) -- Undo
map("i", "<C-y>", "<C-o><C-r>", options) -- Redo
map("i", "<C-s>", "<C-o>:w!<CR>", options) -- Save and bring back to insert mode
map("i", "<C-f>", "<C-o>:/", { noremap = true }) -- Find
map("i", "<C-S-p>", "<C-o>:", { noremap = true }) -- Enter Command Mode
map("i", "<S-tab>", "<C-d>", options) -- Shift tab
map("i", "<C-c>", '<C-o>"+yy', options) -- Copy line to system clipboard
map("i", "<C-v>", '<C-o>"+p', options) -- Past from system clipboard
map("i", "<C-Backspace>", "<C-O>db", options) -- Delete word before cursor

-- Visual Mode
map("v", "<S-Up>", ":m '<-2<CR>gv=gv", options) -- Move selected block up
map("v", "<S-Down>", ":m '>+1<CR>gv=gv", options) -- Move selected block down
map("v", "<tab>", ">", options) -- Indent selected block
map("v", "<S-tab>", "<", options) -- Unindent selected block
map("v", "<C-/>", "gc", options) -- Comment selected block
map("v", "<C-c>", '"+y', options) -- Copy block to system block
map("v", "<C-v>", '"+p', options) -- Paste block to system block

-- Terminal
map("t", "<C-t>", "<C-\\><C-n>:lua toggle_terminal()<CR>", options) -- Close terminal in terminal mode
