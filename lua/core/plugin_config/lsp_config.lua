require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "sumneko_lua", "pyright" } --, "julials", "gopls" }, --  "solargraph",
}

local on_attach = function(_, _)
  -- all workspace diagnostics
  vim.keymap.set("n", "<leader>aa", function()
    vim.diagnostic.setqflist()
  end)

  -- all workspace errors
  vim.keymap.set("n", "<leader>ae", function()
    vim.diagnostic.setqflist { severity = "E" }
  end)

  -- all workspace warnings
  vim.keymap.set("n", "<leader>aw", function()
    vim.diagnostic.setqflist { severity = "W" }
  end)

  -- buffer diagnostics only
  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.setloclist()
  end)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, {})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

  vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, {})
  vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, {})
  vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, {})
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, {})
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
  vim.keymap.set("i", "<C-Space>", require("cmp").complete, {})
end

--require("cmp").setup {
--  sources = {
--    { name = "orgmode" },
--    { name = "path" },
--  },
--}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("neodev").setup {
  -- add any options here, or leave empty to use the default settings
}

--local null_ls = require("null-ls")
--
--null_ls.setup {
--  sources = {
--    null_ls.builtins.formatting.stylua,
--    null_ls.builtins.formatting.black,
--    null_ls.builtins.completion.spell,
--  },
--}

require("lspconfig").sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        require("stylua-nvim").format_file()
      end,
    },
  },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}

--require("lspconfig").solargraph.setup {
--  on_attach = on_attach,
--  capabilities = capabilities,
--}

--require("lspconfig").julials.setup {
--  on_attach = on_attach,
--  capabilities = capabilities,
--}
--
--require("lspconfig").gopls.setup {
--  on_attach = on_attach,
--  capabilities = capabilities,
--}

require("lspconfig").pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = { autoImportCompletion = true },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      },
    },
  },
}
