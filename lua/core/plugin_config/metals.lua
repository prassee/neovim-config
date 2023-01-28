----------------------------------
-- LSP Setup ---------------------
----------------------------------
local api = vim.api
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  superMethodLensesEnabled = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  serverVersion = "latest.snapshot",
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, {})
  -- vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_workspace_symbols, {})
  vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, {})
  vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, {})
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
  vim.keymap.set('i', '<C-Space>', require('cmp').complete, {})

  vim.keymap.set("n", "<leader>ws", function()
    require("metals").hover_worksheet()
  end)

  vim.keymap.set("n", "<leader>aa", function()
    vim.diagnostic.setqflist()
  end)

  -- all workspace errors
  vim.keymap.set("n", "<leader>ae", function()
    vim.diagnostic.setqflist({ severity = "E" })
  end)

  -- all workspace warnings
  vim.keymap.set("n", "<leader>aw", function()
    vim.diagnostic.setqflist({ severity = "W" })
  end)

  -- buffer diagnostics only
  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.setloclist()
  end)

  vim.keymap.set("n", "<leader>mts", function()
    require("metals").toggle_setting("showImplicitArguments")
  end)

  -- Debug settings if you're using nvim-dap
  local dap = require("dap")
  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run or test with input",
      metals = {
        runType = "runOrTestFile",
        args = function()
          local args_string = vim.fn.input("Arguments: ")
          return vim.split(args_string, " +")
        end,
      },
    },
    -- {
    --   type = "scala",
    --   request = "launch",
    --   name = "Run or Test",
    --   metals = {
    --     runType = "runOrTestFile",
    --   },
    -- },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }
  require("metals").setup_dap()
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

--require('lspconfig').metals.setup{
--  on_attach =
--}
