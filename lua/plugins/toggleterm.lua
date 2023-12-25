return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        local Terminal = require("toggleterm.terminal").Terminal
        local Taskui =
            Terminal:new({ cmd = "twtui", hidden = true, direction = "float" })
        local Lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
        })
        function _taskui_toggle()
            Taskui:toggle()
        end

        function _lazygit_toggle()
            Lazygit:toggle()
        end

        vim.api.nvim_set_keymap(
            "n",
            "<leader>tw",
            "<cmd>lua _taskui_toggle()<CR>",
            { noremap = true, silent = true }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>ng",
            "<cmd>lua _lazygit_toggle()<CR>",
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
