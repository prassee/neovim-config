return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require('dressing').setup({
      input = {
        enabled = true,
      }
    })
  end
}
