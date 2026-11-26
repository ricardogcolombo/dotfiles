---@param config {type?:string, args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {} --[[@as string[] | string ]]
	local args_str = type(args) == "table" and table.concat(args, " ") or args --[[@as string]]

	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str)) --[[@as string]]
		if config.type and config.type == "java" then
			---@diagnostic disable-next-line: return-type-mismatch
			return new_args
		end
		return require("dap.utils").splitstr(new_args)
	end
	return config
end

return {
	{
		"mfussenegger/nvim-dap",
		recommended = true,
		desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

		dependencies = {
			"rcarriga/nvim-dap-ui",
			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {
					virt_text_win_col = 80,
				},
			},
		},

    -- stylua: ignore
    keys = {
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Evaluate" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAPUI" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },

		config = function()
			-- load mason-nvim-dap here, after all adapters have been setup
			local mason_nvim_dap = require("lazy.core.config").spec.plugins["mason-nvim-dap.nvim"]
			local Plugin = require("lazy.core.plugin")
			local mason_nvim_dap_opts = Plugin.values(mason_nvim_dap, "opts", false)
			require("mason-nvim-dap").setup(mason_nvim_dap_opts)

			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			local dap_icons = {
				Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
				Breakpoint = " ",
				BreakpointCondition = " ",
				BreakpointRejected = { " ", "DiagnosticError" },
				LogPoint = ".>",
			}
			for name, sign in pairs(dap_icons) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define("Dap" .. name, {
					text = sign[1],
					texthl = sign[2] or "DiagnosticInfo",
					linehl = sign[3],
					numhl = sign[3],
				})
			end

			-- setup dap config by VsCode launch.json file
			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str))
			end

			-- --- DAP value: copy / log / diff helpers -------------------------
			-- Values are written under a per-session run file located in
			-- stdpath("state")/dap-values. Each session gets a fresh file named
			-- from the timestamp so runs can be diffed against each other.
			local dap = require("dap")

			local values_dir = vim.fn.stdpath("state") .. "/dap-values"
			vim.fn.mkdir(values_dir, "p")
			local run_file = values_dir .. "/run-" .. tostring(os.time()) .. ".txt"

			-- Extract an evaluated expression from the current buffer at cursor
			-- (words / ranges are supported).
			local function get_expr()
				return vim.fn.input("Expression: ", vim.fn.expand("<cword>"))
			end

			local function eval_expr(name)
				local ok, val = pcall(dap.evaluate, nil, name)
				if ok and val and val.result ~= nil then
					return tostring(val.result)
				end
				return "<nil>"
			end

			-- Copy the evaluated value of an expression to the clipboard.
			local function copy_value()
				local expr = get_expr()
				if expr == "" then
					return
				end
				local val = eval_expr(expr)
				vim.fn.setreg("+", val)
				vim.notify("dap: copied " .. expr .. " = " .. val, vim.log.levels.INFO)
			end

			-- Append an evaluated expression to this session's run log file.
			local function log_value()
				local expr = get_expr()
				if expr == "" then
					return
				end
				local val = eval_expr(expr)
				local line = string.format("[%s] %s = %s\n", os.date("%H:%M:%S"), expr, val)
				local f = io.open(run_file, "a")
				if f then
					f:write(line)
					f:close()
				end
				vim.notify("dap: logged " .. expr .. " -> " .. run_file, vim.log.levels.INFO)
			end

			-- Diff the two most recent run logs in the dap-values directory.
			local function dap_diff_runs()
				local files = vim.fn.glob(values_dir .. "/run-*.txt", false, true)
				table.sort(files, function(a, b)
					return vim.loop.fs_stat(a).mtime.sec > vim.loop.fs_stat(b).mtime.sec
				end)
				if #files < 2 then
					vim.notify("dap: need at least 2 run logs to diff", vim.log.levels.WARN)
					return
				end
				local newer, older = files[1], files[2]
				local ok, _ = pcall(function()
					vim.cmd("vertical diffsplit " .. vim.fn.fnameescape(newer))
					vim.cmd("diffthis")
				end)
				if not ok then
					-- fallback: open both in split for manual diff
					vim.cmd("split " .. vim.fn.fnameescape(newer))
					vim.cmd("vsplit " .. vim.fn.fnameescape(older))
				end
			end

			-- Fresh run file for each new debug session.
			dap.listeners.after.event_initialized["dap_values_run_file"] = function()
				run_file = values_dir .. "/run-" .. vim.fn.strftime("%Y%m%d-%H%M%S") .. ".txt"
			end

			-- Copy value
			vim.keymap.set({ "n", "v" }, "<leader>dy", copy_value, { desc = "DAP: copy evaluated value" })
			-- Log value to current run
			vim.keymap.set({ "n", "v" }, "<leader>dY", log_value, { desc = "DAP: log evaluated value" })

			vim.api.nvim_create_user_command("DapDiffRuns", dap_diff_runs, { desc = "Diff the two newest DAP run logs" })
		end,
	},

	-- fancy UI for the debugger
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
		opts = {
			controls = {
				enabled = false,
			},
		},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},

	-- mason.nvim integration
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
			},
		},
		-- mason-nvim-dap is loaded when nvim-dap loads
		config = function() end,
	},
}
