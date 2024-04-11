return {
	{
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" }, -- Assuming Harpoon requires plenary.nvim
		config = function()
			require("harpoon").setup({

				global_settings = {
					-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
					save_on_toggle = false,

					-- saves the harpoon file upon every change. disabling is unrecommended.
					save_on_change = true,

					-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
					enter_on_sendcmd = false,

					-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
					tmux_autoclose_windows = false,

					-- filetypes that you want to prevent from adding to the harpoon list menu.
					excluded_filetypes = { "harpoon" },

					-- set marks specific to each git branch inside git repository
					mark_branch = false,

					-- enable tabline with harpoon marks
					tabline = false,
					tabline_prefix = "   ",
					tabline_suffix = "   ",
				}
			})

			-- Add a mark with Harpoon
			vim.keymap.set("n", "<leader>m", function()
				require("harpoon.mark").add_file()
			end, { desc = "Mark file with Harpoon" })

			-- Toggle Harpoon menu
			vim.keymap.set("n", "<leader>h", function()
				require("harpoon.ui").toggle_quick_menu()
			end, { desc = "Toggle Harpoon Menu" })

			-- Example key mappings to jump to the first and second marks
			vim.keymap.set("n", "<leader>1", function()
				require("harpoon.ui").nav_file(1)
			end, { desc = "Harpoon go to mark 1" })
			vim.keymap.set("n", "<leader>2", function()
				require("harpoon.ui").nav_file(2)
			end, { desc = "Harpoon go to mark 2" })
      -- Additional functionality: Send 'ls -La' to tmux window 1
      vim.keymap.set('n', '<leader>t', function() require("harpoon.term").sendCommand(1, "ls -La\n") end, {desc = 'Send ls -La to tmux window 1'})
      -- Key mapping for navigating to or creating terminal 1
      vim.keymap.set('n', '<leader>tt', function() require("harpoon.term").gotoTerminal(1) end, {desc = 'Navigate to or create terminal 1'})
		end,
	},
}
