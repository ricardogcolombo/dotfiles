return {
	"nickjvandyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		local opencode_cmd = "opencode --port"
		---@type snacks.terminal.Opts
		local snacks_terminal_opts = {
			win = {
				position = "right",
				enter = false,
			},
		}

		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
			server = {
				start = function()
					require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
				end,
			},
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		-- Keymaps use <leader>o… so they do not shadow built-in commands
		-- (opencode's defaults override <C-a>/<C-x>/go/+/-, which we avoid).
		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode…" })
		vim.keymap.set({ "n", "x" }, "<leader>ox", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })
		vim.keymap.set({ "n", "t" }, "<C-.>", function()
			require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "x" }, "<leader>og", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add range to opencode", expr = true })
		vim.keymap.set("n", "<leader>oo", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add line to opencode", expr = true })

		vim.keymap.set("n", "<A-u>", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "Scroll opencode up" })
		vim.keymap.set("n", "<A-d>", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "Scroll opencode down" })

		vim.api.nvim_create_user_command("OpenCode", function()
			require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
		end, { desc = "Toggle opencode" })

		vim.api.nvim_create_user_command("OpenCodeAsk", function(opts)
			require("opencode").ask(opts.args, { submit = opts.bang })
		end, { bang = true, nargs = "+", desc = "Ask opencode a question" })

		vim.api.nvim_create_user_command("OpenCodeSelect", function()
			require("opencode").select()
		end, { desc = "Execute opencode action" })
	end,
}
