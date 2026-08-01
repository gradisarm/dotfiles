return {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        view_options = {
            show_hidden = true,
        },
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
    },
    keys = {
        {
            "<leader>e",
            function()
                if vim.bo.filetype == "oil" then
                    require("oil").close()
                else
                    require("oil").open()
                end
            end,
            desc = "Toggle Oil",
        },
    },
}
