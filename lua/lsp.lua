local M = {}

local function on_attach(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "gi", vim.lsp.buf.implementation, "Implementation")
  map("n", "K",  vim.lsp.buf.hover, "Hover docs")

  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")

  map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

  -- Format via conform (falls back to LSP if needed)
  map("n", "<leader>f", function()
    require("conform").format({ async = false, lsp_fallback = true })
  end, "Format buffer")
end

function M.setup()
  -- diagnostics ui
  local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
  for type, text in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = text, texthl = hl, numhl = "" })
  end
  vim.diagnostic.config({
    virtual_text = { spacing = 2, prefix = "●" },
    severity_sort = true,
    float = { border = "rounded" },
  })

  local lspconfig = require("lspconfig")
  lspconfig.pyright.setup({
    on_attach = on_attach,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoImportCompletions = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    },
  })
end

return M

