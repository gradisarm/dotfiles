return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- Define sign icons for each severity
		local signs = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.HINT] = "H",
			[vim.diagnostic.severity.INFO] = "I",
		}

		-- Set diagnostic config
		vim.diagnostic.config({
			signs = {
				text = signs,
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})

		-- Setup capabilities
		-- requires saghen/blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })

		-- lua
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
							-- ["${3rd}/love2d/library"] = true,
						},
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

		-- ts
		vim.lsp.config("ts_ls", {
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
			single_file_support = true,
			init_options = {
				preferences = {
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
					},
				},
			},
		})
		vim.lsp.enable("ts_ls")

		-- tailwindcss
		vim.lsp.config("tailwindcss", {
			settings = {},
		})
		vim.lsp.enable("tailwindcss")

		-- css
		vim.lsp.config("cssls", {
			settings = {
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				less = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})
		vim.lsp.enable("cssls")

		-- go
		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
		})
		vim.lsp.enable("gopls")

		-- java
		vim.lsp.config("jdtls", {})
		vim.lsp.enable("jdtls")

		-- vue
		vim.lsp.config("vue_ls", {})
		vim.lsp.enable("vue_ls")

		-- c#
		vim.lsp.config("roslyn_ls", {
			handlers = {
				-- Drop unidentifiable Roslyn diagnostics to prevent duplicates.
				["textDocument/diagnostic"] = function(err, result, ctx)
					if not (ctx.params and ctx.params.identifier) then
						return
					end
					return vim.lsp.diagnostic.on_diagnostic(err, result, ctx)
				end,
			},
		})
		vim.lsp.enable("roslyn_ls")

		-- c / c++
		vim.lsp.config("clangd", {})
		vim.lsp.enable("clangd")

		-- python
		vim.lsp.config("pyright", {})
		vim.lsp.enable("pyright")

		-- swift
		vim.lsp.config("sourcekit", {})
		vim.lsp.enable("sourcekit")
	end,
}
