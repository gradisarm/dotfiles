return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	config = function()
		local luasnip = require("luasnip")
		luasnip.filetype_extend("javascriptreact", { "html" })
		luasnip.filetype_extend("typescriptreact", { "html" })
		require("luasnip.loaders.from_vscode").lazy_load()

		require("blink.cmp").setup({
			snippets = { preset = "luasnip" },
			signature = { enabled = true },
			appearance = { nerd_font_variant = "normal" },
			cmdline = { enabled = false },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			keymap = {
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-y>"] = { "accept", "fallback" },
			},
			completion = {
				menu = {
					scrolloff = 1,
					scrollbar = false,
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
						},
					},
				},
				documentation = {
					window = { scrollbar = false },
					auto_show = true,
				},
			},
		})
	end,
}
