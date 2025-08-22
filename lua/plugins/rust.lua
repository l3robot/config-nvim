return {
  { "mrcjkb/rustaceanvim", version = "^5", ft = { "rust" } },
  -- rust-analyzer settings + inlay hints
  {
    "neovim/nvim-lspconfig",
    ft = { "rust" },
    opts = {},
    config = function()
      local cmp_cap = require("cmp_nvim_lsp").default_capabilities()
      vim.g.rustaceanvim = {
        server = {
          capabilities = cmp_cap,
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              check = { command = "clippy" },
            },
          },
        },
      }
    end
  },
}

