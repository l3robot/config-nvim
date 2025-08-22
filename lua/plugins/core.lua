return {
  -- Mason + LSP
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig",
    config = function()
      local cmp_cap = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "ruff_lsp", "rust_analyzer" },
        automatic_installation = true,
      })
      local lsp = require("lspconfig")
      lsp.pyright.setup({ capabilities = cmp_cap })
      lsp.ruff_lsp.setup({ capabilities = cmp_cap })
      -- rust_analyzer configured by rustaceanvim (see rust.lua)
    end
  },

  -- Snippets & cmp deps (cmp itself in cmp.lua)
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
}

