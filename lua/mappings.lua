local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

--- Create new terminal
--- type = 1 for new horizontal terminal
--- type = 2 for new vertical terminal
---@param type number
function new_terminal(type)
	if type == 1 then
		require("nvterm.terminal").new("horizontal")
	elseif type == 2 then
		require("nvterm.terminal").new("vertical")
	end
end

--- Toggles terminal
--- type = 1 toggles horizontal terminal
--- type = 2 toggles vertical terminal
--- type = 3 toggles floating terminal
---@param type number
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
-- Lazy Git
map("n", "<leader>gs", ":LazyGit<CR>", options)
map("n", "<C-g>", ":LazyGit<CR>", options)

-- Terminal
map("n", "<leader>th", ":lua toggle_terminal(1)<CR>", options) -- Horizontal Terminal
map("n", "<leader>tv", ":lua toggle_terminal(2)<CR>", options) -- Vertical Terminal
map("n", "<leader>f", ":lua toggle_terminal(3)<CR>", options) -- Floating Terminal
map("n", "<leader>h", ":lua new_terminal(1)<CR>", options) -- Horizontal Terminal
map("n", "<leader>v", ":lua new_terminal(2)<CR>", options) -- Vertical Terminal
map("n", "<C-`>", ":lua toggle_terminal(1)<CR>", options) -- Horizontal Terminal
map("n", "<C-S-`>", ":lua new_terminal(1)<CR>", options) -- Horizontal Terminal

-- Neo Tree
map("n", "<leader>fe", ":Neotree toggle filesystem left<CR>", options) -- Toggle
map("n", "<leader>e", ":Neotree focus<CR>", options) -- Focus
map("n", "<C-e>", ":Neotree toggle left filesystem<CR>", options) -- File Explorer

-- Format Code
map("n", "<leader>fm", ":lua vim.lsp.buf.format({ async = true })<CR>", options)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", options)
map("n", "<leader>gb", ":Telescope git_branches<CR>", options) -- Branches
map("n", "<leader>gc", ":Telescope git_commits<CR>", options) -- Commits
map("n", "<leader>gf", ":Telescope git_files<CR>", options) -- Files
map("n", "<C-p>", ":Telescope fd<CR>", options) -- Find Files

-- Buffers
map("n", "<leader>x", ":bdelete<CR>", options) -- Close current buffer
map("n", "<S-tab>", ":bp<CR>", options) -- Goto previous buffer
map("n", "<tab>", ":bn<CR>", options) -- Goto next buffer

-- Document Symbols
map("n", "<leader>op", ":Neotree toggle right document_symbols<CR>", options)
map("n", "<leader>os", ":Telescope lsp_document_symbols<CR>", options)
map("n", "<C-t>", ":Neotree toggle right document_symbols<CR>", options) -- Document Symbols
map("n", "<S-t>", ":Telescope lsp_document_symbols<CR>", options) -- Search Document Symbols

-- Diagnostics
map("n", "<leader>pp", ":Neotree diagnostics toggle bottom<CR>", options)

-- Comment
map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", options)


-- Windows
map("n", "<C-l>", "<C-w>L", options) -- Move window to the left
map("n", "<C-h>", "<C-w>H", options) -- Move window to the right
map("n", "<C-k>", "<C-w>K", options) -- Move window to the up
map("n", "<C-j>", "<C-w>J", options) -- Move window to the down

-- General
map("n", "<esc>", ":noh<CR>", options) -- Clear highlighting
map("n", "<C-s>", ":w!<CR>", options) -- Save
map("n", "<C-z>", "u<CR>", options) -- Undo
map("n", "<C-y>", "<C-r><CR>", options) -- Redo
map("n", "<C-a>", "ggVG<CR>", options) -- Select all
map("n", "<C-c>", "yy", options) -- Copy to system clipboard
map("n", "<C-v>", "p", options) -- Paste to system clipboard
map("n", "<C-x>", "yydd", options) -- Copy and Cut

-- Insert Mode Keybinds
-- Buffers
map("i", "<C-w>", "<C-o>:bdelete<CR>", options) -- Close current buffer
map("i", "<C-S-tab>", "<C-o>:bp<CR>", options) -- Goto previous buffer
map("i", "<C-tab>", "<C-o>:bn<CR>", options) -- Goto next buffer

-- Neotree
map("i", "<C-e>", "<esc>:Neotree toggle left filesystem<CR>", options) -- File Explorer
map("i", "<C-g>", "<esc>:Neotree toggle left git_status<CR>", options) -- Source Control
map("i", "<C-t>", "<esc>:Neotree toggle right document_symbols<CR>", options) -- Document Symbols

-- Telescope
map("i", "<A-t>", "<esc>:Telescope lsp_document_symbols<CR>", options) -- Search Document Symbols
map("i", "<C-p>", "<esc>:Telescope fd<CR>", options) -- Find Files

-- Terminal
map("i", "<C-`>", "<C-o>:lua toggle_terminal(1)<CR>", options) -- Horizontal Terminal

-- Comment
map("i", "<C-k>", "<C-o>:lua require('Comment.api').toggle.linewise.current()<CR>", options)

-- General
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
map("v", "<tab>", ">gv", options) -- Indent selected block
map("v", "<S-tab>", "<gv", options) -- Unindent selected block
map("v", "<C-c>", "y", options) -- Copy block
map("v", "<C-v>", "p", options) -- Paste block
map("v", "<C-x>", "d", options) -- Copy and Cut block
map("v", "<leader>/", "<ESC>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", options) -- Comment

-- Terminal
map("t", "<C-q>", "<C-\\><C-n>:q<CR>", options) -- Close terminal in terminal mode
map("t", "<C-x>", "<C-\\><C-n>", options) -- Escape Terminal mode
map("t", "<C-`>", "<C-\\><C-n>:lua toggle_terminal(1)<CR>", options) -- Horizontal Terminal
map("t", "<C-S-`>", "<C-\\><C-n>:lua new_terminal(1)<CR>", options) -- Horizontal Terminal
