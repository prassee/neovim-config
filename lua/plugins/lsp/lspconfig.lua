return {
    {
        "L3MON4D3/LuaSnip",
        lazy = false,
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            -- import lspconfig plugin
            local lspconfig = require("lspconfig")

            -- import cmp-nvim-lsp plugin
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local cmp = require("cmp")
            cmp.setup({
                window = {
                    documentation = cmp.config.window.bordered(),
                    completion = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })
            local keymap = vim.keymap -- for conciseness

            local opts = { noremap = true, silent = true }
            local on_attach = function(client, bufnr)
                opts.buffer = bufnr

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set(
                    "n",
                    "<leader>gr",
                    "<cmd>Telescope lsp_references<CR>",
                    opts
                ) -- show definition, references

                -- trigger autocompletion
                keymap.set("i", "<C-Space>", "<C-x><C-o>")

                keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

                opts.desc = "Go to declaration"
                keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set(
                    "n",
                    "<leader>gD",
                    "<cmd>Telescope lsp_definitions<CR>",
                    opts
                ) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set(
                    "n",
                    "<leader>gi",
                    "<cmd>Telescope lsp_implementations<CR>",
                    opts
                ) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set(
                    "n",
                    "gt",
                    "<cmd>Telescope lsp_type_definitions<CR>",
                    opts
                ) -- show lsp type definitions
                keymap.set(
                    "n",
                    "gds",
                    "<cmd>Telescope lsp_document_symbols<CR>"
                )
                keymap.set(
                    "n",
                    "gws",
                    "<cmd>Telescope lsp_workspace_symbols<CR>"
                )

                opts.desc = "See available code actions"
                keymap.set(
                    { "n", "v" },
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    opts
                ) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set(
                    "n",
                    "<leader>D",
                    "<cmd>Telescope diagnostics bufnr=0<CR>",
                    opts
                ) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end

            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Change the Diagnostic symbols in the sign column (gutter)
            -- (not in youtube nvim video)
            local signs =
                { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- configure typescript server with plugin
            lspconfig["tsserver"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                },
            })

            lspconfig["julials"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure python server
            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    pyright = { autoImportCompletion = true },
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "struct",
                            autoImportCompletion = true,
                        },
                    },
                },
            })
            lspconfig["jsonls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    json = {
                        format = {
                            enable = true,
                        },
                    },
                    validate = { enable = true },
                },
            })
            lspconfig["marksman"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            -- configure lua server (with special settings)
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })
        end,
    },
}
