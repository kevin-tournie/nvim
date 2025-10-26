vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
vim.keymap.set('n', "<leader>do", vim.diagnostic.open_float, { desc = 'Open diagnostic window' })
vim.keymap.set('n', "<leader>da", vim.diagnostic.show, { desc = 'Show all diagnostics' })
vim.keymap.set('n', "<leader>dn", vim.diagnostic.get_next, { desc = 'Jump to next diagnostic' })
vim.keymap.set('n', "<leader>dp", vim.diagnostic.get_prev, { desc = 'Jump to previous diagnostic' })
