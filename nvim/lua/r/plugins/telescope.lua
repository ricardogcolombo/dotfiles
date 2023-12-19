return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>o<TAB>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>g<TAB>", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy git files" })
		keymap.set("n", "<leader>fs<TAB>", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set(
			"n",
			"<leader>fc<TAB>",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find string under cursor in cwd" }
		)

		keymap.set("n", "<leader>b<TAB>", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy buffers" })
		keymap.set("n", "<leader>h<TAB>", "<cmd>Telescope help _tags<cr>", { desc = "Fuzzy tags" })
	end,
}
