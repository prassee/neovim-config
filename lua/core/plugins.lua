-- local config = require "lua.luasnip.config"
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("ellisonleao/gruvbox.nvim")
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    --  tag = "nightly", -- optional, updated every week. (see issue #1193)
  }
  use("nvim-lualine/lualine.nvim")
  use("nvim-treesitter/nvim-treesitter")
  -- completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-path") -- source for file system paths
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")
  use("folke/neodev.nvim")

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  }

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { {
      "nvim-lua/plenary.nvim",
    } },
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }
  use { 'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    } }

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeoutlen = 560
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }

  -- use { "ellisonleao/glow.nvim" }

  use {
    "ckipp01/stylua-nvim",
    config = function()
      require("stylua-nvim").setup { config_file = "stylua.toml" }
    end,
  }

  use {
    "nvim-orgmode/orgmode",
    requires = {
      {
        "akinsho/org-bullets.nvim",
        config = function()
          require("org-bullets").setup()
        end,
      },
    },
    config = function()
      require("orgmode").setup {}
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  }

  use { "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup()
    end
  }
  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' }
    }
  }

  use { "f-person/git-blame.nvim" }

  use {
    "folke/todo-comments.nvim",
    --  TODO:  move this to a plugin config file
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'mind'.setup()
    end
  }
  use("stevearc/dressing.nvim") -- makes UI nicer
  --
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
