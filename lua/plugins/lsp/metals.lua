local map = vim.keymap.set

return {
    "scalameta/nvim-metals",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "mfussenegger/nvim-dap",
            config = function(self, opts)
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
                    {
                        type = "scala",
                        request = "launch",
                        name = "Run or Test",
                        metals = {
                            runType = "runOrTestFile",
                        },
                    },
                    {
                        type = "scala",
                        request = "launch",
                        name = "Test Target",
                        metals = {
                            runType = "testTarget",
                        },
                    },
                    {
                        type = "scala",
                        request = "launch",
                        name = "Run minimal2 main",
                        metals = {
                            mainClass = "minimal2.Main",
                            buildTarget = "minimal",
                        },
                    },
                }
            end,
        },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
        local metals_config = require("metals").bare_config()

        -- Example of settings
        metals_config.settings = {
            showImplicitArguments = true,
            showImplicitConversionsAndClasses = true,
            showInferredType = true,
            superMethodLensesEnabled = true,
            enableSemanticHighlighting = true,
            excludedPackages = {
                "akka.actor.typed.javadsl",
                "com.github.swagger.akka.javadsl",
            },
            -- testUserInterface = "Test Explorer",
            serverVersion = "latest.snapshot",
        }

        -- *READ THIS*
        -- I *highly* recommend setting statusBarProvider to true, however if you do,
        -- you *have* to have a setting to display this in your statusline or else
        -- you'll not see any messages from metals. There is more info in the help
        -- docs about this

        metals_config.init_options.statusBarProvider = "on"

        -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
        metals_config.capabilities =
            require("cmp_nvim_lsp").default_capabilities()

        metals_config.on_attach = function(client, bufnr)
            require("metals").setup_dap()

            -- LSP mappings
            map("n", "<leader>gD", "<cmd>Telescope lsp_definitions<CR>")
            map("n", "K", vim.lsp.buf.hover)
            map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>")
            map("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>")
            map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>")
            map("n", "<leader>wS", "<cmd>Telescope lsp_workspace_symbols")
            map("n", "<leader>mc", function()
                require("telescope").extensions.metals.commands()
            end)
            map("n", "<leader>cl", function()
                vim.lsp.codelens.run()
                require("dap").repl.open()
            end)
            map("n", "<leader>sh", vim.lsp.buf.signature_help)
            map("n", "<leader>rn", vim.lsp.buf.rename)
            map("n", "<leader>f", vim.lsp.buf.format)
            map("n", "<leader>ca", vim.lsp.buf.code_action)

            map("n", "<leader>ws", function()
                require("metals").hover_worksheet({ border = "single" })
            end)

            -- all workspace diagnostics
            map("n", "<leader>aa", vim.diagnostic.setqflist)

            -- all workspace errors
            map("n", "<leader>ae", function()
                vim.diagnostic.setqflist({ severity = "E" })
            end)

            -- all workspace warnings
            map("n", "<leader>aw", function()
                vim.diagnostic.setqflist({ severity = "W" })
            end)

            -- buffer diagnostics only
            map("n", "<leader>d", vim.diagnostic.setloclist)

            map("n", "[c", function()
                vim.diagnostic.goto_prev({ wrap = false })
            end)

            map("n", "]c", function()
                vim.diagnostic.goto_next({ wrap = false })
            end)

            -- Example mappings for usage with nvim-dap. If you don't use that, you can
            -- skip these
            map("n", "<leader>dc", function()
                require("dap").continue()
            end)

            map("n", "<leader>dr", function()
                require("dap").repl.toggle()
            end)

            map("n", "<leader>dK", function()
                require("dap.ui.widgets").hover()
            end)

            map("n", "<leader>dt", function()
                require("dap").toggle_breakpoint()
            end)

            map("n", "<leader>dso", function()
                require("dap").step_over()
            end)

            map("n", "<leader>dsi", function()
                require("dap").step_into()
            end)

            map("n", "<leader>dl", function()
                require("dap").run_last()
            end)
        end

        return metals_config
    end,
    config = function(self, metals_config)
        local nvim_metals_group =
            vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = self.ft,
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end,
}
