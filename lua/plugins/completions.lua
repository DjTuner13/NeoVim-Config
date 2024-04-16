return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		build = "make install_jsregexp",
        config = function()
        local ls = require("luasnip")

        vim.keymap.set("i", "<C-K>", function() ls.expand() end, {silent = false, desc = "Expand snippet"})
        vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true, desc = "Jump forward in snippet"})
        vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true, desc = "Jump backward in snippet"})
        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true, desc = "Next snippet choice"})
    end
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.filetype_extend("php", { "html" })
			vim.opt.completeopt = "menu,menuone,noselect"
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
					{ name = "buffer" },
					{ name = "path" }, -- file system paths
					{
						name = "html-css",
						option = {
							max_count = {}, -- not ready yet
							enable_on = {
								"html",
								"php",
							}, -- set the file types you want the plugin to work on
							file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
							style_sheets = {
								-- example of remote styles, only css no js for now
								"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
								"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
							},
						},
					},
				}),
				formatting = {
					format = function(entry, vim_item)
						if entry.source.name == "html-css" then
							vim_item.menu = entry.completion_item.menu
						end
						return vim_item
					end,
				},
			})
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))


		end,
	},
}
