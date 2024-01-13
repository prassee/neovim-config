--
-- catppuccin is very neat just exploring alternatives
-- nordic is not good, breaks the  side bar tree
-- gruvbox is very classical
-- cyberdream works best with transparent terminal
--
--
--
--
return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
