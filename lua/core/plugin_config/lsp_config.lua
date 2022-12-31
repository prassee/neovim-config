require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "solargraph", "pyright" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

  vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, {})
  vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_workspace_symbols, {})
  vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, {})
  vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, {})
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

require("lspconfig").solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = { pyright = { autoImportCompletion = true, },
    python = { analysis = {
      autoSearchPaths = true,
      diagnosticMode = 'workspace',
      useLibraryCodeForTypes = true,
      typeCheckingMode = 'basic'
    }
    }
  }
}
