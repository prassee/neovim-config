-- return {
--     "catppuccin/nvim",
--     lazy = false,
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme("catppuccin")
--     end,
-- }

-- return {
--     "AlexvZyl/nordic.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("nordic").load()
--         vim.cmd.colorscheme("nordic")
--     end,
-- }
--
return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        vim.o.background = "dark" -- or "light" for light mode
        vim.cmd([[colorscheme gruvbox]])
    end,
}
