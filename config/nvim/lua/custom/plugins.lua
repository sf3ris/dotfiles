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
      require "plugins.configs.lspconfig"
      require "custom.config.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.config.null-ls"
    end
  },
  {
    "simrat39/rust-tools.nvim",
    event = "VeryLazy",
    config = function ()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-d>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>d", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
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
    'jparise/vim-graphql'
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "yuezk/vim-js"
  },
  {
    "prisma/vim-prisma"
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {}
  }
}

return plugins

