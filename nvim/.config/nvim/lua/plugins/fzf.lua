return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			keymap = {
				fzf = { true },
				builtin = { true },
			},
		})

		vim.keymap.set("n", "<C-f>", fzf.git_files, {})
		vim.keymap.set("n", "<leader>ff", fzf.files, {})
		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Fzf buffers" })
		vim.keymap.set("n", "<leader>fg", fzf.live_grep, {})
		vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Fzf help tags" })
	end,
}
