return {
	-- LSP Configuration for Neovim 0.11+ using native vim.lsp.config
	-- Note: nvim-lspconfig plugin is deprecated in Neovim 0.11+
	"hrsh7th/cmp-nvim-lsp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- Debug function to check LSP status
			opts.desc = "Check LSP status"
			keymap.set("n", "<leader>ls", function()
				local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
				if #clients == 0 then
					print("No LSP clients attached to this buffer")
				else
					for _, client in ipairs(clients) do
						print("LSP client attached: " .. client.name)
					end
				end
			end, opts)

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", function()
				-- Try FzfLua first, fallback to built-in
				local fzf_ok, _ = pcall(vim.cmd, "FzfLua lsp_references")
				if not fzf_ok then
					vim.lsp.buf.references()
				end
			end, opts) -- show definition, references

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", function()
				-- Try FzfLua first, fallback to built-in
				local fzf_ok, _ = pcall(vim.cmd, "FzfLua lsp_definitions")
				if not fzf_ok then
					vim.lsp.buf.definition()
				end
			end, opts) -- show lsp definitions

			opts.desc = "Go to declaration"
					keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename


			opts.desc = "Show line diagnostics"
					keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
			vim.lsp.config.html = {
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html" },
			capabilities = capabilities,
			on_attach = on_attach,
			}
			vim.lsp.enable('html')

			-- configure typescript server
			vim.lsp.config.ts_ls = {
					cmd = { "typescript-language-server", "--stdio" },
					filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
					capabilities = capabilities,
					on_attach = on_attach,
			}
			vim.lsp.enable('ts_ls')

		-- configure go server
			vim.lsp.config.gopls = {
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			capabilities = capabilities,
			on_attach = on_attach,
			}
			vim.lsp.enable('gopls')
		--
		-- configure css server
		vim.lsp.config.cssls = {
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "css", "scss", "less" },
			capabilities = capabilities,
			on_attach = on_attach,
		}
			vim.lsp.enable('cssls')

		-- configure tailwindcss server
		vim.lsp.config.tailwindcss = {
			cmd = { "tailwindcss-language-server", "--stdio" },
			filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
			capabilities = capabilities,
			on_attach = on_attach,
		}
			vim.lsp.enable('tailwindcss')

		-- configure svelte server
		vim.lsp.config.svelte = {
			cmd = { "svelteserver", "--stdio" },
			filetypes = { "svelte" },
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		}
			vim.lsp.enable('svelte')

		-- configure prisma orm server
		vim.lsp.config.prismals = {
			cmd = { "prisma-language-server", "--stdio" },
			filetypes = { "prisma" },
			capabilities = capabilities,
			on_attach = on_attach,
		}
			vim.lsp.enable('prismals')

		-- configure graphql language server
		vim.lsp.config.graphql = {
			cmd = { "graphql-lsp", "server", "-m", "stream" },
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			capabilities = capabilities,
			on_attach = on_attach,
		}
			vim.lsp.enable('graphql')

		-- configure emmet language server
		vim.lsp.config.emmet_ls = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			capabilities = capabilities,
			on_attach = on_attach,
		}
			vim.lsp.enable('emmet_ls')

		-- configure python server
		vim.lsp.config.pyright = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			capabilities = capabilities,
			on_attach = on_attach,
		}
			vim.lsp.enable('pyright')

		-- configure lua server (with special settings)
		vim.lsp.config.lua_ls = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
			}
			vim.lsp.enable('lua_ls')
	end,
}
