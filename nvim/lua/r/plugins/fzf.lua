return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {

		files = {
			command = function()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
				if vim.v.shell_error == 0 then
					local path = vim.fn.substitute(git_root, "\\n", "", "")
					return "git -C " .. vim.fn.shellescape(path) .. " ls-files --exclude-standard"
				else
					return "fd --type f --hidden --exclude .git --exclude .cache --exclude build --exclude node_modules"
				end
			end,

			cwd = function()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
				if vim.v.shell_error == 0 then
					return vim.fn.substitute(git_root, "\\n", "", "")
				else
					return vim.fn.getcwd()
				end
			end,
		},

		-- You can add other global fzf-lua options here, outside of 'files'
		-- For example, for actions, keybindings, or different pickers:
		-- actions = {
		--   ['ctrl-s'] = function(selected) print(selected) end,
		-- },
		winopts = {
			height = 0.95,
			width = 0.95,
			row = 0.0,
			col = 0.0,
			border = "rounded",
			preview = "hidden", -- or 'down', 'up', 'right', 'left'
		},
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
