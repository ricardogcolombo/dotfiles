return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- Your configuration options go here.
		-- For example, to enable some common presets:
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
		},
		-- You can also customize views, routes, etc.
		-- views = {
		--   cmdline_popup = {
		--     position = {
		--       row = 5,
		--       col = "50%",
		--     },
		--     size = {
		--       width = 60,
		--       height = "auto",
		--     },
		--   },
		-- },
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- OPTIONAL: 'nvim-notify' is only needed if you want to use the notification view.
		-- If not available, 'mini' is used as a fallback.
		"rcarriga/nvim-notify",
	},
}
