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
			
			-- LSP-related FZF keybindings
			vim.keymap.set("n", "gR", function()
				-- Try FzfLua first, fallback to built-in
				local fzf_ok, _ = pcall(vim.cmd, "FzfLua lsp_references")
				if not fzf_ok then
					vim.lsp.buf.references()
				end
			end, { desc = "Show LSP references" })
			
			vim.keymap.set("n", "gd", function()
				-- Try FzfLua first, fallback to built-in
				local fzf_ok, _ = pcall(vim.cmd, "FzfLua lsp_definitions")
				if not fzf_ok then
					vim.lsp.buf.definition()
				end
			end, { desc = "Show LSP definitions" })
			
			vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "Show LSP implementations" })
			vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
			vim.keymap.set("n", "<leader>lD", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Show buffer diagnostics" })
	end,
}
