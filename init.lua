vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "
vim.opt.winborder = "rounded"

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },

	-- Completion plugins
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },

	{ src = "https://github.com/folke/which-key.nvim" },

	{ src = "https://github.com/mfussenegger/nvim-jdtls" }
})

vim.cmd("colorscheme vague")

require("mason").setup({
	ensure_installed = { "lua-language-server", "bash-language-server", "typescript-language-server", "vue-language-server", "jdtls" }
})


-- LSP Configuration
local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
		'/vue-language-server' .. '/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vue_language_server_path,
	languages = { 'vue' },
	configNamespace = 'typescript',
}

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local ts_ls = {
	capabilities = capabilities,
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = tsserver_filetypes,
}

local lua_ls = {
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


local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
local launcher_jar = vim.fn.glob(jdtls_path .. "plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = jdtls_path .. "config_linux"
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")


local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)

local jdtls = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-javaagent:" .. lombok_path,
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens", "java.base/java.util=ALL-UNNAMED",
		"--add-opens", "java.base/java.lang=ALL-UNNAMED",
		"-jar", launcher_jar,
		"-configuration", config_path,
		"-data", workspace_dir
	},
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "/opt/openjdk8/bin/"
					}
				}
			}
		}
	},
	filetypes = { "java" },
	root_markers = root_markers,
	root_dir = root_dir
}

vim.lsp.config("ts_ls", ts_ls)
vim.lsp.config("lua_ls", lua_ls)
vim.lsp.config("bashls", {})
vim.lsp.config("jdtls", jdtls)

vim.lsp.enable({ "lua_ls", "ts_ls", "vue_ls", "bashls", "jdtls" })

-- LSP keymaps
vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format, { desc = 'Format the file' })
vim.keymap.set('n', "<leader>li", vim.lsp.buf.implementation, { desc = 'Show implementations' })
vim.keymap.set('n', "<leader>ln", vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', "<leader>lr", vim.lsp.buf.references, { desc = 'Show references' })
vim.keymap.set('n', "<leader>lt", vim.lsp.buf.type_definition, { desc = 'Show type definition' })
vim.keymap.set('n', "<leader>ld", vim.lsp.buf.document_symbol, { desc = 'Show document symbol' })

-- jdtls keymaps
vim.keymap.set('n', "<leader>lo", require("jdtls").organize_imports, { desc = 'Organize imports' })
vim.keymap.set('n', "<leader>lc", require("jdtls").compile, { desc = 'Compile the project' })
vim.keymap.set('n', "<leader>lb", function()
	require("jdtls").build_projects({
		select_mode = "prompt",
		full_build = false
	})
end, { desc = 'Compile the project' })

-- Diagnostic keymaps
vim.keymap.set('n', "<leader>do", vim.diagnostic.open_float, { desc = 'Open diagnostic window' })
vim.keymap.set('n', "<leader>da", vim.diagnostic.show, { desc = 'Show all diagnostics' })
vim.keymap.set('n', "<leader>dn", vim.diagnostic.get_next, { desc = 'Jump to next diagnostic' })
vim.keymap.set('n', "<leader>dp", vim.diagnostic.get_prev, { desc = 'Jump to previous diagnostic' })

-- Telescope keymaps
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

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

-- Autocompletion engine
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
