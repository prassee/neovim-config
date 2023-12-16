return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", 
config = function() 
    local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "typescript","rust","toml", "scala" , "julia"},
  highlight = { enable = true },
  indent = { enable = true },
})


  end
}
