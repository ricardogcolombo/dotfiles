-- Markdown review with glow.
--
-- Renders the current markdown buffer with glow (https://github.com/charmbracelet/glow)
-- inside a toggle terminal pane. The personal-docs search/browse keymaps live
-- in lua/r/plugins/fzf.lua (kept there to avoid duplicating the fzf-lua spec).

return {
	-- Idempotent with the snacks.nvim instance opencode.nvim depends on; this
	-- spec simply guarantees it is present and wires up the glow command.
	{
		"folke/snacks.nvim",
		opts = { terminal = {}, input = {} },
		config = function()
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
				-- `glow -p` renders into a pager; q: quit, toggling away the
				-- terminal buffer also leaves the file untouched.
				require("snacks.terminal").toggle("glow -p " .. vim.fn.shellescape(f), {
					win = { position = "right", size = 60 },
				})
			end

			-- <leader>mg = "markdown: glow"
			vim.keymap.set("n", "<leader>mg", glow_open, { desc = "Review markdown with glow" })
			vim.api.nvim_create_user_command("Glow", glow_open, { desc = "Review current markdown file with glow" })
		end,
	},
}