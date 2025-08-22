local o = vim.opt

-- UI
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.termguicolors = true
o.cursorline = true
o.scrolloff = 6

-- Editing
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true
o.wrap = false

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

-- Files & performance
o.undofile = true
o.swapfile = false
o.updatetime = 250
o.timeoutlen = 400

-- Behavior
o.splitright = true
o.splitbelow = true
o.mouse = "a"
o.clipboard = "unnamedplus" -- use system clipboard

-- Folding powered by Treesitter
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99 -- starts with all folds open



