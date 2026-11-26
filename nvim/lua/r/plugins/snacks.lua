-- Snacks: startup dashboard + terminal + glow markdown review.
--
-- One authoritative folke/snacks.nvim spec. It provides:
--   * a startup dashboard with a recent-sessions section + quick actions,
--   * the snacks terminal used by opencode.nvim and the `:Glow` command,
--   * a glow-based markdown reviewer (`<leader>mg` / `:Glow`).
--
-- (opencode.nvim pulls snacks in as a dependency too; lazy merges the specs.
--  Keep the `opts` here merged with the terminal/picker/input settings that
--  opencode relies on.)

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Required by opencode.nvim (see lua/r/plugins/opencode.lua).
		input = {},
		picker = {},
		terminal = {},
		dashboard = {
			preset = "doom",
			sections = {
				{ section = "header" },
				{ section = "recent_sessions", title = "Recent sessions", limit = 8, indent = 2 },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		-- --- custom "Recent sessions" dashboard section --------------------
		-- Lists <cwd %%branch>.vim files written by folke/persistence.nvim
		-- under stdpath("state")/sessions, newest first, capped by `limit`.
		-- Selecting one chdir's to the project and sources the session.
		local sessions_dir = vim.fn.stdpath("state") .. "/sessions"

		---@param item table section config from the dashboard spec
		---@return snacks.dashboard.Item[]
		local function recent_sessions(item)
			local limit = item.limit or 8
			local files = vim.fn.glob(sessions_dir .. "/*.vim", false, true)
			table.sort(files, function(a, b)
				local sa, sb = vim.loop.fs_stat(a), vim.loop.fs_stat(b)
				return sa and sb and sa.mtime.sec > sb.mtime.sec
			end)

			local ret = {} ---@type snacks.dashboard.Item[]
			for _, file in ipairs(files) do
				if #ret >= limit then
					break
				end
				-- Filename is `<cwd with % for /, \\ and :> [%%<branch>].vim`
				local base = vim.fn.fnamemodify(file, ":t:r") -- strip .vim
				local dir_part, branch = base:match("^(.*)%%(.*)$")
				if not dir_part then
					dir_part, branch = base, nil
				end
				local dir = dir_part:gsub("%%", "/")
				if vim.loop.fs_stat(dir) then -- skip deleted projects
					local desc = vim.fn.fnamemodify(dir, ":~")
					if branch and branch ~= "" then
						desc = desc .. " (" .. branch .. ")"
					end
					ret[#ret + 1] = {
						desc = desc,
						icon = " ",
						autokey = true,
						action = function()
							vim.fn.chdir(dir)
							vim.cmd("silent! source " .. vim.fn.fnameescape(file))
						end,
					}
				end
			end
			return ret
		end
		local dashboard = require("snacks.dashboard")
		dashboard.sections.recent_sessions = recent_sessions

		-- --- glow markdown review -----------------------------------------
		-- Render the current markdown buffer with glow in a right-hand
		-- terminal pane.
		local function current_md_file()
			local f = vim.fn.expand("%:p")
			if f == "" or vim.bo.filetype ~= "markdown" then
				vim.notify("glow: current buffer is not a markdown file", vim.log.levels.WARN)
				return nil
			end
			return f
		end

		local function glow_open()
			local f = current_md_file()
			if not f then
				return
			end
			require("snacks.terminal").toggle("glow -p " .. vim.fn.shellescape(f), {
				win = { position = "right", size = 60 },
			})
		end

		vim.keymap.set("n", "<leader>mg", glow_open, { desc = "Review markdown with glow" })
		vim.api.nvim_create_user_command("Glow", glow_open, { desc = "Review current markdown file with glow" })
	end,
}