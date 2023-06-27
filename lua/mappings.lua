local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Define a function to toggle the terminal
function toggle_terminal(type)
	if type == 1 then
		require("nvterm.terminal").toggle("horizontal")
	elseif type == 2 then
		require("nvterm.terminal").toggle("vertical")
	elseif type == 3 then
		require("nvterm.terminal").toggle("float")
	end
end

-- Normal Mode Keybinds
-- Git
map("n", "<leader>gs", ":Telescope git_status<CR>", options) -- Status
map("n", "<leader>gb", ":Telescope git_branches<CR>", options) -- Branches
map("n", "<leader>gc", ":Telescope git_commits<CR>", options) -- Commits
map("n", "<leader>gf", ":Telescope git_files<CR>", options) -- Files

-- NvTerm
map("n", "<leader>t", ":lua toggle_terminal(1)<CR>", options) -- Horizontal Terminal
map("n", "<leader>tv", ":lua toggle_terminal(2)<CR>", options) -- Vertical Terminal
map("n", "<leader>tf", ":lua toggle_terminal(3)<CR>", options) -- Floating Terminal

-- Theme Picker
map("n", "<leader>th", ":Telescope colorscheme<CR>", options)

-- Neo Tree
map("n", "<leader>fe", ":Neotree toggle<CR>", options) -- Toggle
map("n", "<leader>e", ":Neotree focus<CR>", options) -- Focus

-- Format Code
map("n", "<leader>fm", ":lua vim.lsp.buf.format({ async = true }) print('formatted')<CR>", options)

-- Find Files
map("n", "<leader>ff", ":Telescope find_files<CR>", options)

-- Buffers
map("n", "<C-w>", ":bdelete<CR>", options) -- Close current buffer
map("n", "<S-tab>", ":bp<CR>", options) -- Goto previous buffer
map("n", "<tab>", ":bn<CR>", options) -- Goto next buffer

-- Common Keybinds
map("n", "<esc>", ":noh<CR>", options) -- Clear highlighting
map("n", "<C-s>", ":w!<CR>", options) -- Save
map("n", "<C-z>", "u<CR>", options) -- Undo
map("n", "<C-y>", "<C-r><CR>", options) -- Redo
map("n", "<C-a>", "ggVG<CR>", options) -- Select all
map("n", "<C-c>", "yy", options) -- Copy to system clipboard
map("n", "<C-v>", "p", options) -- Paste to system clipboard
map("n", "<C-x>", "yydd", options) -- Copy and Cut
map("n", "<C-e>", ":Neotree toggle left filesystem<CR>", options)
map("n", "<C-g>", ":Neotree toggle left git_status<CR>", options)
map("n", "<C-t>", ":Neotree toggle left document_symbols<CR>", options)

-- Insert Mode Keybinds
-- Buffers
map("i", "<C-w>", "<C-o>:bdelete<CR>", options) -- Close current buffer
map("i", "<C-S-tab>", "<C-o>:bp<CR>", options) -- Goto previous buffer
map("i", "<C-tab>", "<C-o>:bn<CR>", options) -- Goto next buffer

-- Common Keybinds
map("i", "<C-z>", "<C-o>u", options) -- Undo
map("i", "<C-y>", "<C-o><C-r>", options) -- Redo
map("i", "<C-s>", "<C-o>:w!<CR>", options) -- Save
map("i", "<C-f>", "<C-o>/", { noremap = true }) -- Find
map("i", "<C-S-p>", "<C-o>:", { noremap = true }) -- Enter Quick Command Mode
map("i", "<S-tab>", "<C-d>", options) -- Shift tab
map("i", "<C-c>", "<C-o>yy", options) -- Copy line to system clipboard
map("i", "<C-v>", "<C-o>p", options) -- Past from system clipboard
map("i", "<C-Backspace>", "<C-W>", options) -- Delete word before cursor
map("i", "<C-x>", "<esc>yyddi", options) -- Copy and Cut

-- Visual Mode
map("v", "<S-Up>", ":m '<-2<CR>gv=gv", options) -- Move selected block up
map("v", "<S-Down>", ":m '>+1<CR>gv=gv", options) -- Move selected block down
map("v", "<tab>", ">", options) -- Indent selected block
map("v", "<S-tab>", "<", options) -- Unindent selected block
map("v", "<C-k>", "gc", options) -- Comment selected block
map("v", "<C-c>", "y", options) -- Copy block
map("v", "<C-v>", "p", options) -- Paste block
map("v", "<C-x>", "d", options) -- Copy and Cut block

-- Terminal
map("t", "<C-q>", "<C-\\><C-n>:q<CR>", options) -- Close terminal in terminal mode
