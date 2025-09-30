vim.pack.add({
	"https://github.com/nvim-tree/nvim-tree.lua"
})

require("nvim-tree").setup({})

vim.keymap.set('n', "<leader>tt", ':NvimTreeToggle<CR>')
