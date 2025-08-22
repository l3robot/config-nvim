return {
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "rust", "lua", "vim", "query" },
        highlight = { enable = true },
        incremental_selection = { enable = true },
      })
    end
  },
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("telescope").setup({}) end
  },
  { "lewis6991/gitsigns.nvim", config = true },
  { "folke/which-key.nvim", config = true },
  { "nvim-lualine/lualine.nvim",
    config = function() require("lualine").setup({}) end
  },
}

