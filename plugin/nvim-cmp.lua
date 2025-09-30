vim.pack.add({
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" }
})

local cmp = require("cmp")

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect"
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(),      -- close completion window
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true }) -- Confirm the selected item or first if none selected
			else
				fallback()                 -- Default tab behavior (e.g., insert tab or jump snippet)
			end
		end, { 'i', 's' }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" }, -- file system paths
	}),
})
