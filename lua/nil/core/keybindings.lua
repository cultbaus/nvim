vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set('n', 'q:', ':q')
vim.keymap.set('n', '<C-n>', vim.cmd.Ex)

vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])
