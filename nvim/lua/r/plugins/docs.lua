-- Personal docs integration.
--
-- Provides fast access + search over ~/personal/docs and a glow-based
-- markdown review workflow, all from Neovim.

-- Root folder that holds all personal markdown documents.
local DOCS_ROOT = vim.fn.expand("~") .. "/personal/docs"

return {
	-- --- Aligns with the existing fzf-lua plugin (already present in this
	-- config and set up with `<leader>f...` bindings); here we only add the
	-- personal-docs pickers + a way to root nvim-tree at the docs folder.
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- If the docs folder doesn't exist, bail out with a clear message.
			if not vim.loop.fs_stat(DOCS_ROOT) then
				vim.notify("personal_docs folder not found: " .. DOCS_ROOT, vim.log.levels.WARN)
				return
			end

			-- --- Find / browse files inside ~/personal/docs ------------------
			vim.keymap.set("n", "<leader>df", function()
				require("fzf-lua").files({ cwd = DOCS_ROOT })
			end, { desc = "[d]ocs: find files in ~/personal/docs" })

			-- --- Search document contents (live grep) --------------------------
			vim.keymap.set("n", "<leader>ds", function()
				require("fzf-lua").live_grep({ cwd = DOCS_ROOT })
			end, { desc = "[d]ocs: search contents of ~/personal/docs" })

			-- --- Open the docs folder in the nvim-tree file explorer ----------
			vim.keymap.set("n", "<leader>de", function()
				-- Ensure nvim-tree is loaded before toggling it.
				require("nvim-tree.api").tree.open({ path = DOCS_ROOT })
			end, { desc = "[d]ocs: browse ~/personal/docs in nvim-tree" })
		end,
	},

	-- --- Review the current markdown file with glow ------------------------
	-- Opens a right-hand toggle terminal running `glow -p <current file>` so
	-- you get a fully rendered view without leaving Neovim. Quit glow (q) to
	-- close the pane, or toggle it away with <C-m>.
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