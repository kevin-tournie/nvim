vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars = { eob = " " } -- no ~ symbols
vim.opt.scrolloff = 10
vim.g.mapleader = " "
vim.opt.winborder = "rounded"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Disabled for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },

	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },

	{ src = "https://github.com/folke/which-key.nvim" },

	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
})

require("mason").setup({
	ensure_installed = { "lua-language-server", "bash-language-server", "typescript-language-server", "vue-language-server", "jdtls" }
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
		'/vue-language-server' .. '/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vue_language_server_path,
	languages = { 'vue' },
	configNamespace = 'typescript',
}

local ts_ls = {
	capabilities = capabilities,
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = tsserver_filetypes,
}
vim.lsp.config("ts_ls", ts_ls)
vim.lsp.enable({ "lua_ls", "ts_ls", "vue_ls", "bashls", "jdtls" })

-- LSP keymaps
vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format, { desc = 'Format the file' })
vim.keymap.set('n', "<leader>li", vim.lsp.buf.implementation, { desc = 'Show implementations' })
vim.keymap.set('n', "<leader>ln", vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', "<leader>lr", vim.lsp.buf.references, { desc = 'Show references' })
vim.keymap.set('n', "<leader>lt", vim.lsp.buf.type_definition, { desc = 'Show type definition' })
vim.keymap.set('n', "<leader>ld", vim.lsp.buf.document_symbol, { desc = 'Show document symbol' })

-- Diagnostic keymaps
vim.keymap.set('n', "<leader>do", vim.diagnostic.open_float, { desc = 'Open diagnostic window' })
vim.keymap.set('n', "<leader>da", vim.diagnostic.show, { desc = 'Show all diagnostics' })
vim.keymap.set('n', "<leader>dn", vim.diagnostic.get_next, { desc = 'Jump to next diagnostic' })
vim.keymap.set('n', "<leader>dp", vim.diagnostic.get_prev, { desc = 'Jump to previous diagnostic' })

-- Autoclosing keymaps
local autopairs = {
	['{'] = '{}',
	['('] = '()',
	['['] = '[]',
	['"'] = '""',
	["'"] = "''",
	['`'] = '``',
}

for open, close in pairs(autopairs) do
	vim.keymap.set('i', open, close .. '<Left>', { noremap = true })
end

-- auto commands
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
