vim.g.mapleader = " "

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { silent = true })
