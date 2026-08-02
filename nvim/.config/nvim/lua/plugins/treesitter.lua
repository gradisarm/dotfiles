return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local parsers = {
			"xml",
			"http",
			"bash",
			"html",
			"css",
			"javascript",
			"typescript",
			"json",
			"yaml",
			"toml",
			"lua",
			"luadoc",
			"luap",
			"query",
			"regex",
			"vim",
			"vimdoc",
			"go",
			"gomod",
			"gowork",
			"gosum",
			"c_sharp",
			"tsx",
			"vue",
			"c",
			"cpp",
			"cmake",
			"make",
			"glsl",
			"diff",
		}

		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ts_start", { clear = true }),
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
