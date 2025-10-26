return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Load just before saving
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },

				-- web
				vue = { "prettier" },
				html = { "prettier" },
				css = { "prettier " },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				xml = { "xmllint" },
			},
		})
	end,
}
