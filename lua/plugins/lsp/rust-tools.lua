return {
    "simrat39/rust-tools.nvim",
    config = function()
        local rt = require("rust-tools")
        local mason_registry = require("mason-registry")

        local codelldb = mason_registry.get_package("codelldb")
        local extension_path = codelldb:get_install_path() .. "/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

        rt.setup({
            dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(
                    codelldb_path,
                    liblldb_path
                ),
            },
            server = {
                settings = {
                    ["rust_analyzer"] = { cargo = { allFeatures = true } },
                },
                checkOnSave = {
                    allFeatures = true,
                    overrideCommand = {
                        "cargo",
                        "clippy",
                        "--workspace",
                        "--message-format=json",
                        "--all-targets",
                        "--all-features",
                    },
                },
                on_attach = function(_, bufnr)
                    local opts =
                        { noremap = true, silent = true, buffer = bufnr }
                    local keymap = vim.keymap
                    -- set keybinds
                    opts.desc = "Show LSP references"
                    keymap.set(
                        "n",
                        "<leader>gr",
                        "<cmd>Telescope lsp_references<CR>",
                        opts
                    ) -- show definition, references

                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)

                    -- go to declaration
                    opts.desc = "Go to declaration"
                    keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Show LSP definitions"
                    keymap.set(
                        "n",
                        "<leader>gd",
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
                        "<leader>gt",
                        "<cmd>Telescope lsp_type_definitions<CR>",
                        opts
                    ) -- show lsp type definitions
                    keymap.set(
                        "n",
                        "<leader>gds",
                        "<cmd>Telescope lsp_document_symbols<CR>",
                        opts
                    )
                    keymap.set(
                        "n",
                        "<leader>gws",
                        "<cmd>Telescope lsp_workspace_symbols<CR>",
                        opts
                    )

                    -- see available code actions, in visual mode will apply to selection
                    opts.desc = "See available code actions"
                    keymap.set(
                        { "n", "v" },
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        opts
                    )
                    keymap.set(
                        "n",
                        "<C-space>",
                        rt.hover_actions.hover_actions,
                        opts
                    )

                    opts.desc = "Smart rename"
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                    -- show  diagnostics for file
                    opts.desc = "Show buffer diagnostics"
                    keymap.set(
                        "n",
                        "<leader>D",
                        "<cmd>Telescope diagnostics bufnr=0<CR>",
                        opts
                    )

                    -- show diagnostics for line
                    opts.desc = "Show line diagnostics"
                    keymap.set(
                        "n",
                        "<leader>d",
                        vim.diagnostic.open_float,
                        opts
                    )

                    -- jump to previous diagnostic in buffer
                    opts.desc = "Go to previous diagnostic"
                    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

                    -- jump to next diagnostic in buffer
                    opts.desc = "Go to next diagnostic"
                    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                    -- show documentation for what is under cursor
                    opts.desc = "Show documentation for what is under cursor"
                    keymap.set("n", "K", vim.lsp.buf.hover, opts)

                    -- mapping to restart lsp if necessary
                    opts.desc = "Restart LSP"
                    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
                end,
            },
            tools = {
                executor = require("rust-tools.executors").quickfix,
                inlay_hints = {
                    -- automatically set inlay hints (type hints)
                    -- default: true
                    auto = true,

                    -- Only show inlay hints for the current line
                    only_current_line = false,

                    -- whether to show parameter hints with the inlay hints or not
                    -- default: true
                    show_parameter_hints = true,

                    -- prefix for parameter hints
                    -- default: "<-"
                    parameter_hints_prefix = "<- ",

                    -- prefix for all the other hints (type, chaining)
                    -- default: "=>"
                    other_hints_prefix = "=> ",

                    -- whether to align to the length of the longest line in the file
                    max_len_align = false,

                    -- padding from the left if max_len_align is true
                    max_len_align_padding = 1,

                    -- whether to align to the extreme right or not
                    right_align = false,

                    -- padding from the right if right_align is true
                    right_align_padding = 7,

                    -- The color of the hints
                    highlight = "Comment",
                },

                reload_workspace_from_cargo_toml = true,
                hover_actions = {
                    auto_focus = true,
                },
            },
        })
    end,
}
