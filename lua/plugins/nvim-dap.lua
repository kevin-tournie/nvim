return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("dapui").setup()

		vim.keymap.set("n", "<leader>do", require("dapui").open, { desc = "Open the DAP UI" })
		vim.keymap.set("n", "<leader>dc", require("dapui").close, { desc = "Close the DAP UI" })
	end,
}
