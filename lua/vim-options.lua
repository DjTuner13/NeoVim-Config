vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true

--this is for easier esc key one handed
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})


