vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
     -- custom_only = true,
      list = {
        { key = ".", action = "toggle_git_ignored" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = false,
      git_placement = "before",
      -- modified_placement = "after",
      glyphs = {
        folder = {
          --arrow_closed = "⏵",
          --arrow_open = "⏷",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
}

vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf(0) then
      vim.cmd("quit")
    end
  end,
})
