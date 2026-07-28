return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- lua
				lua = { "stylua" },

				-- c
				c = { "clang-format" },

				-- cpp
				cpp = { "clang-format" },

				-- go
				go = { "gofmt" },

				-- c#
				cs = { "csharpier" },

				-- Web technologies
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },

				-- shell
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
			formatters = {
				["google-java-format"] = {
					args = { "--aosp", "-" },
				},
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			-- },
		})
		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format()
		end, { noremap = true, silent = true })
	end,
}
