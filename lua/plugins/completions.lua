return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
 {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local ls = require("luasnip")
            ls.setup({
                load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
                    markdown = {"lua", "json"},
                    html = {"javascript"}
                })
            })
        end,
    },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          {
            name = "html-css",
            option = {
            max_count = {}, -- not ready yet
            enable_on = {
              "html"
            }, -- set the file types you want the plugin to work on
            file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
            style_sheets = {
            -- example of remote styles, only css no js for now
            "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
            "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
            }
            }
          },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(entry, vim_item)
              if entry.source.name == "html-css" then
                  vim_item.menu = entry.completion_item.menu
              end
              return vim_item
          end
        }
      })
    end,
  },
}
