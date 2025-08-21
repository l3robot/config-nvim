require("lazy").setup({
  -- Detect tab/indent settings automatically per file
  { "tpope/vim-sleuth" },

  -- A simple colorscheme so you can see plugins are working
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}, {
  ui = { border = "rounded" },
  checker = { enabled = false }, -- we'll manage updates manually
})

