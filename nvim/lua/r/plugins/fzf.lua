return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {
		-- This is where all your fzf-lua configurations go
		-- The 'files' table is nested directly inside 'opts'

		files = {
			command = function()
				-- Try to find the Git root
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
				if vim.v.shell_error == 0 then
					-- If in a Git repo, use git ls-files. It's fast and respects .gitignore.
					-- 'git -C <path> ls-files' ensures it's run from the correct root.
					local path = vim.fn.substitute(git_root, "\\n", "", "")
					return "git -C " .. vim.fn.shellescape(path) .. " ls-files --exclude-standard"
				else
					-- Fallback for non-Git projects or if git is not available.
					-- 'fd' is generally preferred over 'find' if available, as it's faster.
					-- Use '--hidden' to include dotfiles, and '--exclude .git' to skip git dirs.
					-- IMPORTANT: Ensure 'fd' is installed and executable in your PATH.
					-- If not, comment this line and uncomment the 'find' line.
					return "fd --type f --hidden --exclude .git --exclude .cache --exclude build --exclude node_modules"
					-- return 'find . -type f -not -path "./.git/*" -not -path "./node_modules/*" -not -path "./target/*" -not -path "./build/*"'
				end
			end,

			cwd = function()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
				if vim.v.shell_error == 0 then
					-- Return the Git root path
					return vim.fn.substitute(git_root, "\\n", "", "")
				else
					-- Fallback to Neovim's current working directory
					return vim.fn.getcwd()
				end
			end,

			-- Optional: You can add other 'files' specific options here
			-- For example, to change the default prompt or results layout:
			-- prompt = ' Files> ',
			-- layout = {
			--   height = 0.8,
			--   width = 0.8,
			--   preview_height = 0.5,
			-- },
			-- previewer = 'builtin', -- 'builtin' uses Neovim's built-in preview, 'bat' uses bat if installed
		},

		-- You can add other global fzf-lua options here, outside of 'files'
		-- For example, for actions, keybindings, or different pickers:
		-- actions = {
		--   ['ctrl-s'] = function(selected) print(selected) end,
		-- },
		-- winopts = {
		--   height = 0.95,
		--   width = 0.95,
		--   row = 0.0,
		--   col = 0.0,
		--   border = 'rounded',
		--   preview = 'hidden', -- or 'down', 'up', 'right', 'left'
		-- },
	},
	-- Lazy.nvim's 'config' function is good for setting keymaps *after* the plugin is loaded
	config = function(_, opts)
		-- This ensures fzf-lua is set up with your options
		require("fzf-lua").setup(opts)

		-- Set your keybindings here
		vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<cr>", { desc = "Find files in project root" })
		vim.keymap.set("n", "<leader>g", "<cmd>FzfLua live_grep_glob<cr>", { desc = "Live grep in project root" })
		vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
		vim.keymap.set("n", "<leader>h", "<cmd>FzfLua help_tags<cr>", { desc = "Help tags" })
		-- Add more keybindings as needed
	end,
}
