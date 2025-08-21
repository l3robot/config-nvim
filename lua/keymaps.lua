local map = vim.keymap.set
local silent = { noremap = true, silent = true }

-- Basics
map("n", "<leader>w", "<cmd>update<cr>", silent)          -- save if changed
map("n", "<leader>q", "<cmd>q<cr>", silent)               -- quit
map("n", "<leader>Q", "<cmd>qa!<cr>", silent)             -- quit all (force)
map("n", "<leader>h", "<cmd>nohlsearch<cr>", silent)      -- clear search

-- Better window nav
map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)
map("n", "<C-l>", "<C-w>l", silent)

-- Resize
map("n", "<A-Left>",  "<cmd>vertical resize -2<cr>", silent)
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", silent)
map("n", "<A-Down>",  "<cmd>resize -2<cr>", silent)
map("n", "<A-Up>",    "<cmd>resize +2<cr>", silent)

-- Quick file explorer (built-in netrw for now)
map("n", "<leader>e", "<cmd>Ex<cr>", silent)

