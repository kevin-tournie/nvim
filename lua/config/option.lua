vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.winborder = "rounded"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Disabled for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)
