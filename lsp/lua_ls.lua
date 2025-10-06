local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local c = vim.lsp.get_client_by_id(args.data.client_id)
		if not c then return end

								if vim.bo.filetype == "lua" then
			-- Format the current buffer on save
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
				end,
			})
		end
	end,
})

return {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' }
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			}
		}
	}
}
