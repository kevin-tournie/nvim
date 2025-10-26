return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "typescript", "yaml", "java", "lua", "vue", "markdown", "xml" },
			auto_install = true,
			sync_install = false,
			ignore_install = {},
			modules = {},
		})

		-- treats tmpl file like yaml file so I get syntax highlighting
		vim.filetype.add({
			extension = {
				tmpl = "yaml",
			},
		})
	end,
}
