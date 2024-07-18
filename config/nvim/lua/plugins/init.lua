local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        "intelephense",
        "rust-analyzer",
        "codelldb",
        "graphql-lsp",
        "elixirls"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end
  },
  {
    "simrat39/rust-tools.nvim",
    event = "VeryLazy",
    config = function ()
      return require "configs.rust-tools"
    end
  },
  {
    'glepnir/template.nvim',
    cmd = {"Template","TemProject"},
    config = function ()
      require("template").setup({
        temp_dir = '~/.config/nvim/templates'
      })
    end
  },
  {
    'jparise/vim-graphql',
    ft = "graphql"
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown", "md" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "yuezk/vim-js",
    ft = {"js", "ts"}
  },
  {
    "prisma/vim-prisma",
    ft = {"js", "ts"}
  },
  {
    "mistricky/codesnap.nvim", 
    lazy = true,
    build = "make",
    cmd = { "CodeSnapSave", "CodeSnap" },
    config = function () 
      return require "configs.codesnap"
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }
}

return plugins
