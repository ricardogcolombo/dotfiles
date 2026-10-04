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

		live_grep = {
			cwd = function()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
				if vim.v.shell_error == 0 then
					return vim.fn.substitute(git_root, "\\n", "", "")
				else
					return vim.fn.getcwd()
				end
			end,
		},

		live_grep_glob = {
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
	},
	-- Lazy.nvim's 'config' function is good for setting keymaps *after* the plugin is loaded
	config = function(_, opts)
		-- This ensures fzf-lua is set up with your options
		require("fzf-lua").setup(opts)

		-- Set your keybindings here
		vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<cr>", { desc = "Find files in project root" })
		vim.keymap.set("n", "<leader>ffg", "<cmd>FzfLua live_grep_glob<cr>", { desc = "Live grep in project root" })
		vim.keymap.set("n", "<leader>fgs", "<cmd>FzfLua git_status<cr>", { desc = "git stauts" })
		vim.keymap.set("n", "<leader>fgg", "<cmd>FzfLua git_files<cr>", { desc = "git files" })
		vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help tags" })
			
			-- LSP pickers live under <leader>l so we do not shadow built-in g* commands.
			-- Neovim 0.11+ already provides grn/gra/grr/gri/grt/gO and [d/]d natively.
			vim.keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP references" })
			vim.keymap.set("n", "<leader>lg", "<cmd>FzfLua lsp_definitions<CR>", { desc = "LSP definitions" })
			vim.keymap.set("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP implementations" })
			vim.keymap.set("n", "<leader>lt", "<cmd>FzfLua lsp_type_definitions<CR>", { desc = "LSP type definitions" })
			vim.keymap.set("n", "<leader>lD", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Buffer diagnostics" })
	end,
}
