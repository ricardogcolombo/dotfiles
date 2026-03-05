return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"Lazygit",
		"LazygitCurrentFile",
		"LazygitRoot",
	},
	keys = {
		{ "<leader>gg", "<cmd>Lazygit<cr>", { desc = "Open lazygit" } },
		{ "<leader>gf", "<cmd>LazygitCurrentFile<cr>", { desc = "Open lazygit for current file" } },
		{ "<leader>gr", "<cmd>LazygitRoot<cr>", { desc = "Open lazygit at repo root" } },
	},
}
