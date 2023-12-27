return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        local terminal = require("toggleterm.terminal").Terminal
        local task_ui =
            terminal:new({ cmd = "twtui", hidden = true, direction = "float" })
        local lazy_git = terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
        })
        function Taskui_toggle()
            task_ui:toggle()
        end

        function Lazygit_toggle()
            lazy_git:toggle()
        end

        vim.api.nvim_set_keymap(
            "n",
            "<leader>tw",
            "<cmd>lua Taskui_toggle()<CR>",
            { noremap = true, silent = true }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>ng",
            "<cmd>lua Lazygit_toggle()<CR>",
            { noremap = true, silent = true }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>t",
            ":ToggleTerm direction=float<CR>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>|",
            ":ToggleTerm direction=vertical<CR>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>_",
            ":ToggleTerm direction=horizontal<CR>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "v",
            "<leader><leader><Enter>",
            ":ToggleTermSendVisualSelection <CR>",
            { noremap = true, silent = true }
        )
    end,
}
