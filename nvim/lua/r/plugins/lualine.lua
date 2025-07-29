return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- Gruvbox Dark color palette
		local colors = {
			dark0_hard = "#1d2021",
			dark0 = "#282828",
			dark0_soft = "#32302f",
			dark1 = "#3c3836",
			dark2 = "#504945",
			dark3 = "#665c54",
			dark4 = "#7c6f64",
			light0_hard = "#f9f5d7",
			light0 = "#fbf1c7",
			light0_soft = "#f2e5bc",
			light1 = "#ebdbb2",
			light2 = "#d5c4a1",
			light3 = "#bdae93",
			light4 = "#a89984",
			bright_red = "#fb4934",
			bright_green = "#b8bb26",
			bright_yellow = "#fabd2f",
			bright_blue = "#83a598",
			bright_purple = "#d3869b",
			bright_aqua = "#8ec07c",
			bright_orange = "#fe8019",
			neutral_red = "#cc241d",
			neutral_green = "#98971a",
			neutral_yellow = "#d79921",
			neutral_blue = "#458588",
			neutral_purple = "#b16286",
			neutral_aqua = "#689d6a",
			neutral_orange = "#d65d0e",
			faded_red = "#9d0006",
			faded_green = "#79740e",
			faded_yellow = "#b57614",
			faded_blue = "#076678",
			faded_purple = "#8f3f71",
			faded_aqua = "#427b58",
			faded_orange = "#af3a03",
		}

		local gruvbox_lualine_theme = {
			normal = {
				a = { bg = colors.neutral_blue, fg = colors.dark0, gui = "bold" },
				b = { bg = colors.dark2, fg = colors.light2 },
				c = { bg = colors.dark1, fg = colors.light3 },
			},
			insert = {
				a = { bg = colors.neutral_green, fg = colors.dark0, gui = "bold" },
				b = { bg = colors.dark2, fg = colors.light2 },
				c = { bg = colors.dark1, fg = colors.light3 },
			},
			visual = {
				a = { bg = colors.neutral_purple, fg = colors.dark0, gui = "bold" },
				b = { bg = colors.dark2, fg = colors.light2 },
				c = { bg = colors.dark1, fg = colors.light3 },
			},
			command = {
				a = { bg = colors.neutral_yellow, fg = colors.dark0, gui = "bold" },
				b = { bg = colors.dark2, fg = colors.light2 },
				c = { bg = colors.dark1, fg = colors.light3 },
			},
			replace = {
				a = { bg = colors.neutral_red, fg = colors.dark0, gui = "bold" },
				b = { bg = colors.dark2, fg = colors.light2 },
				c = { bg = colors.dark1, fg = colors.light3 },
			},
			inactive = {
				a = { bg = colors.dark2, fg = colors.light4, gui = "bold" },
				b = { bg = colors.dark1, fg = colors.light4 },
				c = { bg = colors.dark0, fg = colors.light4 },
			},
		}

		-- configure lualine with gruvbox theme
		lualine.setup({
			options = {
				theme = gruvbox_lualine_theme,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.bright_orange },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
