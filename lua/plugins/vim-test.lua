return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux"
    },
    config = function()

      -- php testing
      vim.g['test#php#phpunit#executable'] = './vendor/bin/phpunit'

      -- Setting key mappings
      vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', { desc = "Run nearest test" })
      vim.keymap.set('n', '<leader>T', ':TestFile<CR>', { desc = "Run tests in current file" })
      vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', { desc = "Run entire test suite" })
      vim.keymap.set('n', '<leader>l', ':TestLast<CR>', { desc = "Run last test" })
      vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', { desc = "Go to last test file" })
    end
  },
  vim.cmd("let test#strategy = 'vimux'")
}

