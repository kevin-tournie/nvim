local M = {}

local lsp_icons = {
	bashls = "🐚", -- Bash
	jdtls  = "☕", -- Java
	lua_ls = "⚡", -- Lua
	ts_ls  = "🌐", -- JavaScript / TypeScript
	vue_ls = "🌿", -- Vue
}

function M.lsp_status()
	local buffer = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.get_clients({ bufnr = buffer })

	if next(clients) == nil then
		return ""
	end

	local names = {}
	for _, client in pairs(clients) do
		table.insert(names, lsp_icons[client.name] .. ' ' .. client.name)
	end

	return table.concat(names, ", ")
end

return M
