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
              journal = "/data/neorg/journal",
              learning = "/data/nerog/learning",
              research = "/data/neorg/research",
              develop = "/data/neorg/develop",
              errands = "/data/neorg/errands",
            },
          },
        },
      },
    }
  end,
}
