--
-- catppuccin is very neat just exploring alternatives
-- nordic is not good, breaks the  side bar tree
-- gruvbox is very classical
-- cyberdream works best with transparent terminal
-- hybrid is something new and suits my color preference
--
return {
    "HoNamDuong/hybrid.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("hybrid")
    end,
    opts = {},
}
