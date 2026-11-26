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

		-- Personal docs access + search (~/personal/docs)
		local docs_root = vim.fn.expand("~") .. "/personal/docs"
		local function has_docs()
			if vim.loop.fs_stat(docs_root) then
				return true
			end
			vim.notify("personal_docs folder not found: " .. docs_root, vim.log.levels.WARN)
			return false
		end
		vim.keymap.set("n", "<leader>df", function()
			if has_docs() then
				require("fzf-lua").files({ cwd = docs_root })
			end
		end, { desc = "[d]ocs: find files in ~/personal/docs" })
		vim.keymap.set("n", "<leader>ds", function()
			if has_docs() then
				require("fzf-lua").live_grep({ cwd = docs_root })
			end
		end, { desc = "[d]ocs: search contents of ~/personal/docs" })
		vim.keymap.set("n", "<leader>de", function()
			if has_docs() then
				require("nvim-tree.api").tree.open({ path = docs_root })
			end
		end, { desc = "[d]ocs: browse ~/personal/docs in nvim-tree" })

		-- Open the current file from another git worktree in a vsplit.
		-- <leader>fw lists all git worktrees; choosing one opens the current
		-- buffer's path from that worktree, and <C-d> diffs it against the
		-- worktree copy.
		local function pick_worktree(diff)
			local rel = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
			local picker = require("fzf-lua")
			local entries = vim.fn.systemlist("git worktree list --porcelain")
			local wts = {}
			for _, e in ipairs(entries) do
				if e:sub(1, 4) == "work" then
					wts[#wts + 1] = vim.trim(e:sub(7))
				end
			end
			if vim.tbl_isempty(wts) then
				vim.notify("fzf: no git worktrees found", vim.log.levels.WARN)
				return
			end
			picker.fzf_exec(wts, {
				prompt = diff and "Diff worktree > " or "Open in worktree > ",
				actions = {
					["default"] = function(sel)
						local wt = sel[1]
						local target = vim.fn.fnamemodify(wt, ":p") .. "/" .. rel
						if diff then
							vim.cmd("vertical diffsplit " .. vim.fn.fnameescape(target))
							vim.cmd("diffthis")
						else
							vim.cmd("vsplit " .. vim.fn.fnameescape(target))
						end
					end,
					["ctrl-d"] = function(sel)
						local wt = sel[1]
						local target = vim.fn.fnamemodify(wt, ":p") .. "/" .. rel
						vim.cmd("vertical diffsplit " .. vim.fn.fnameescape(target))
						vim.cmd("diffthis")
					end,
				},
			})
		end
		vim.keymap.set("n", "<leader>fw", function()
			pick_worktree(false)
		end, { desc = "[w]orktree: open current file in another worktree" })

		-- LSP pickers live under <leader>l so we do not shadow built-in g* commands.
			-- Neovim 0.11+ already provides grn/gra/grr/gri/grt/gO and [d/]d natively.
			vim.keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP references" })
			vim.keymap.set("n", "<leader>lg", "<cmd>FzfLua lsp_definitions<CR>", { desc = "LSP definitions" })
			vim.keymap.set("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP implementations" })
			vim.keymap.set("n", "<leader>lt", "<cmd>FzfLua lsp_type_definitions<CR>", { desc = "LSP type definitions" })
			vim.keymap.set("n", "<leader>lD", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Buffer diagnostics" })
	end,
}
