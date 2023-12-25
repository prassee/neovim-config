return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                rust = { "rustfmt" },
                scala = { "scalafmt" },
            },

            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
                async = false,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>sf", function()
            conform.format({
                lsp_fallback = true,
                async = true,
            })
        end)
    end,
}
