return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end


            vim.keymap.set("n", "=", api.tree.change_root_to_node, opts("CD"))

            vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set("n", "n", api.fs.create, opts("Create File Or Directory"))
            vim.keymap.set("n", "n", api.fs.create, opts("Create File Or Directory"))
            vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
        end

        require("nvim-tree").setup {
            on_attach = my_on_attach,
            disable_netrw = false,
            hijack_netrw = false,
            view = {
                preserve_window_proportions = true,
                side = "right",
            },
        }

        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
    end,
}
