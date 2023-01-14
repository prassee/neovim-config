vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').commands)
-- using Ctrl+s to save buffer to retain my muscle mem
vim.keymap.set('i', '<C-s>', '<Esc>:w<cr>')
vim.keymap.set('n', '<C-s>', '<Esc>:w<cr>')
vim.keymap.set(
  "n",
  "<leader>fb",
  require('telescope').extensions.file_browser.file_browser,
  { noremap = true }
)
