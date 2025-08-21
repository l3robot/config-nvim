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

  -- Treesitter core
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        -- essentials
        "lua", "vim", "vimdoc", "query",
        -- your stacks
        "python", "rust", "toml",
        -- nice to have
        "bash", "json", "yaml", "markdown", "markdown_inline"
      },
      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } }, -- python indent is iffy; we’ll use a formatter later
      incremental_selection = {
        enable = true,
        -- NOTE: if <C-Space> doesn’t work in your terminal, change these to "<leader>v" and "<leader>V"
        keymaps = {
          init_selection = "<C-Space>",
          node_incremental = "<C-Space>",
          node_decremental = "<BS>",
          scope_incremental = false,
        },
      },
      -- textobjects config lives here; plugin below just provides queries
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- jump forward to target
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Treesitter-powered text objects (af/if/ac/ic, ]m/[[, etc.)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  ---------------------------------------------------------------------------
  -- LSP + tools for Python
  ---------------------------------------------------------------------------

  -- mason: install language servers / formatters / linters
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })
    end,
  },
  -- hook mason into lspconfig & ensure pyright present
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = { ensure_installed = { "pyright" } },
  },
  -- core LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("lsp").setup() end,
  },

}, {
  ui = { border = "rounded" },
  checker = { enabled = false }, -- we'll manage updates manually
})

