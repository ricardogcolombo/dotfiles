-- Colorscheme configuration
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Make sure to load this before all the other start plugins
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = false,
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				telescope = true,
				mason = true,
				which_key = true,
				noice = true,
			},
		})
	end,
}

