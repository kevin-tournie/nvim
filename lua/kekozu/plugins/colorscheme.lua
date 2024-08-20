return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local transparent = true

		require("tokyonight").setup({
			style = "night",
			transparent = transparent,
			styles = {
				sidebars = transparent and "transparent" or "dark",
				floats = transparent and "transparent" or "dark",
			},
			on_colors = function(colors) end,
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
