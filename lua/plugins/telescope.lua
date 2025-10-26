return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = { width = 0.9 },
				},
				sorting_strategy = "ascending",
				prompt_prefix = "🔍 ",
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
		vim.keymap.set('n', '<leader>fc', function()
			local config_dir = vim.fn.stdpath("config")
			builtin.find_files({
				cwd = config_dir
			})
		end)
	end,
}
