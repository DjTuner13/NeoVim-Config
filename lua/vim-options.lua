vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true

--this is for easier esc key one handed
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})


-- Set the leader key to Space
vim.g.mapleader = ' '

-- Remap Control-D to Space+d
vim.api.nvim_set_keymap('n', '<Space>d', '<C-d>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>u', '<C-u>', { noremap = true })


-- Map the leader key followed by ww to cycle through windows
vim.api.nvim_set_keymap('n', '<Leader>ww', '<C-W>w', { noremap = true })


