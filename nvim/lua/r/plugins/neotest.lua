return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-jest",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		-- Setup neotest with Jest adapter
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "jest.config.js",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
			-- Configure test discovery patterns
			discovery = {
				enabled = true,
				concurrent = 1,
			},
			-- Configure test output
			output = {
				enabled = true,
				open_on_run = "short",
			},
			-- Configure test summary
			summary = {
				enabled = true,
				expand_errors = true,
				follow = true,
				mappings = {
					expand = { "<CR>", "<2-LeftMouse>" },
					expand_all = "e",
					output = "o",
					run = "r",
					stop = "s",
					watch = "w",
				},
			},
			-- Configure icons
			icons = {
				expanded = "▾",
				collapsed = "▸",
				passed = "✓",
				running = "●",
				failed = "✗",
				unknown = "?",
				non_collapsible = "─",
				skipped = "⊝",
			},
			-- Configure floating windows
			floating = {
				border = "rounded",
				max_height = 0.6,
				max_width = 0.6,
			},
		})

		-- Keybindings for neotest (avoiding conflicts with existing tab keybindings)
		local keymap = vim.keymap.set

		-- Test running keybindings
		keymap("n", "<leader>tt", function()
			require("neotest").run.run()
		end, { desc = "Run nearest test" })

		keymap("n", "<leader>tr", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Run current file tests" })

		keymap("n", "<leader>ta", function()
			require("neotest").run.run(vim.fn.getcwd())
		end, { desc = "Run all tests" })

		keymap("n", "<leader>tl", function()
			require("neotest").run.run_last()
		end, { desc = "Run last test" })

		-- Test debugging (integrates with your DAP setup)
		keymap("n", "<leader>td", function()
			require("neotest").run.run({ strategy = "dap" })
		end, { desc = "Debug nearest test" })

		-- Test UI keybindings
		keymap("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { desc = "Toggle test summary" })

		keymap("n", "<leader>tO", function()
			require("neotest").output_panel.toggle()
		end, { desc = "Toggle test output panel" })

		keymap("n", "<leader>to", function()
			require("neotest").output.open({ enter = true, auto_close = true })
		end, { desc = "Show test output" })

		-- Test watching (run tests on file changes)
		keymap("n", "<leader>tw", function()
			require("neotest").watch.toggle(vim.fn.expand("%"))
		end, { desc = "Watch current file tests" })

		-- Stop running tests
		keymap("n", "<leader>tS", function()
			require("neotest").run.stop()
		end, { desc = "Stop running tests" })

		-- Test navigation
		keymap("n", "]t", function()
			require("neotest").jump.next({ status = "failed" })
		end, { desc = "Jump to next failed test" })

		keymap("n", "[t", function()
			require("neotest").jump.prev({ status = "failed" })
		end, { desc = "Jump to previous failed test" })

		-- Mark tests
		keymap("n", "<leader>tm", function()
			require("neotest").run.run({ suite = false, extra_args = { "--verbose" } })
		end, { desc = "Run test with verbose output" })
	end,
}
