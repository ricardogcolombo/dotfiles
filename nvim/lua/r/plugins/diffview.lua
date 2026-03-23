return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview Branch History" },
	},
	config = function()
		require("diffview").setup({
			use_icons = true,
			file_panel = {
				listing_style = "tree",
				position = "left",
				width = 35,
			},
			view = {
				default = { layout = "diff2_horizontal" },
				merge_tool = { layout = "diff3_horizontal" },
			},
		})
	end,
}
