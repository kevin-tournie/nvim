return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
	},
	config = function()
		local vue_language_server_path = vim.fn.expand("$MASON/packages")
				.. "/vue-language-server"
				.. "/node_modules/@vue/language-server"
		local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

		local vue_plugin = {
			name = "@vue/typescript-plugin",
			location = vue_language_server_path,
			languages = { "vue" },
			configNamespace = "typescript",
		}

		local ts_ls = {
			init_options = {
				plugins = {
					vue_plugin,
				},
			},
			filetypes = tsserver_filetypes,
		}
		vim.lsp.config("ts_ls", ts_ls)
		vim.lsp.enable({ "ts_ls", "vue_ls", "bashls", "jdtls" })

		-- LSP keymaps
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format the file" })
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Show implementations" })
		vim.keymap.set("n", "<leader>gn", vim.lsp.buf.rename, { desc = "Rename" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Show type definition" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.document_symbol, { desc = "Show document symbol" })
	end,
}
