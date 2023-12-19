return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              journal = "~/neorg/journal",
              learning = "~/nerog/learning",
              research = "~/neorg/research",
              develop = "~/neorg/develop",
              errands = "~/neorg/errands",
            },
            default_workspace = "journal",
          },
        },
      },
    }
  end,
}
