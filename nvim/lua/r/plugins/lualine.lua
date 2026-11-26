return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- VS Code Dark+ color palette
		local colors = {
			-- Dark+ editor chrome
			bg = "#1e1e1e",
			bg2 = "#252526",
			bg3 = "#2d2d30",
			bg4 = "#3e3e42",
			-- Foreground + tokens
			fg = "#cccccc",
			fg_bright = "#ffffff",
			-- Syntax accents used for the active/mode segments
			blue = "#569cd6",
			green = "#6a9955",
			yellow = "#dcdcaa",
			orange = "#ce9178",
			purple = "#c586c0",
			red = "#f44747",
			cyan = "#4ec9b0",
			gray = "#6a6a6a",
		}

		local vscode_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = "#1e1e1e", gui = "bold" },
				b = { bg = colors.bg3, fg = colors.fg },
				c = { bg = colors.bg2, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = "#1e1e1e", gui = "bold" },
				b = { bg = colors.bg3, fg = colors.fg },
				c = { bg = colors.bg2, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.purple, fg = "#1e1e1e", gui = "bold" },
				b = { bg = colors.bg3, fg = colors.fg },
				c = { bg = colors.bg2, fg = colors.fg },
			},
			command = {
				a = { bg = colors.orange, fg = "#1e1e1e", gui = "bold" },
				b = { bg = colors.bg3, fg = colors.fg },
				c = { bg = colors.bg2, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = "#1e1e1e", gui = "bold" },
				b = { bg = colors.bg3, fg = colors.fg },
				c = { bg = colors.bg2, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.bg3, fg = colors.gray, gui = "bold" },
				b = { bg = colors.bg2, fg = colors.gray },
				c = { bg = colors.bg3, fg = colors.gray },
			},
		}

		-- Format the current file path: show the last 3 folders + the file name.
		-- e.g. ~/work/foo/bar/src/main.lua  ->  "…/foo/bar/src/main.lua"
		local function path_fmt()
			local f = vim.fn.expand("%:p")
			local is_md = vim.bo.filetype == "markdown"
			if f == "" or f == nil then
				return vim.fn.expand("%")
			end
			local parts = vim.fn.split(f, "/")
			local n = #parts
			local keep = 3 -- number of trailing folders to show
			local start_idx = math.max(1, n - keep)
			local tail = table.concat(vim.list_slice(parts, start_idx, n), "/")
			-- Prepend a compact marker if we've trimmed leading folders.
			if start_idx > 1 then
				tail = "…/" .. tail
			end
			-- For markdown (personal docs etc.) keep it short and readable.
			if is_md then
				return vim.fn.fnamemodify(f, ":~:t")
			end
			return tail
		end

		lualine.setup({
			options = {
				theme = vscode_lualine_theme,
			},
			sections = {
				lualine_c = {
					{
						path_fmt,
						padding = { left = 1, right = 1 },
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.orange },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}