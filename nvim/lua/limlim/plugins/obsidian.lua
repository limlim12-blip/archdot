return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        workspaces = {
            {
                name = "Limlim",

                path = "/home/lim/Documents/Obsidian_Vault/Limlim",
            },
        },

        disable_frontmatter = true,

        notes_subdir = "notes",
        new_notes_location = "notes_subdir",

        daily_notes = {
            folder = "notes/dailies",
            date_format = "%Y-%m-%d",
            alias_format = "%B %-d, %Y (%A)",
            default_tags = { "daily" },
            template = "daily.md"
        },

        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            substitutions = {
                weekday = function() return os.date("%A") end,
                yesterday = function() return os.date("%Y-%m-%d", os.time() - 86400) end,
                tomorrow = function() return os.date("%Y-%m-%d", os.time() + 86400) end,
            },
        },


        ui = { enable = false },
    },

    config = function(_, opts)
        require("obsidian").setup(opts)


        vim.keymap.set("n", "<leader>on", function()
            vim.cmd("ObsidianTemplate default")
            vim.defer_fn(function() vim.cmd([[0,/^\S/s/^\n\+//]]) end, 100)
        end, { desc = "Apply default template" })

        vim.keymap.set("n", "<leader>t", function()
            local time = os.date("%H:%M") .. " - "
            vim.api.nvim_put({ time }, "c", true, true)
            vim.cmd("startinsert!")
        end, { desc = "Insert time" })
    end,
}
