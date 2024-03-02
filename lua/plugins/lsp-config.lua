return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    after = {"mason.nvim"},
    --lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      --vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      --capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.phpactor.setup({
        capabilities = capabilities
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities
      })
      lspconfig.lemminx.setup({
        capabilities = capabilities
      })

      --lspconfig.intelephense.setup({
        --capabilities = capabilities
      --})
      lspconfig.cssls.setup({
        capabilities = capabilities,
        settings = {
        css = {
          validate = true
        },
        scss = {
          validate = true
        },
        less = {
          validate = true
        }
      }
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  { "Jezda1337/nvim-html-css",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim"
    },
    config = function()
            require("html-css"):setup()
    end
  },
}
