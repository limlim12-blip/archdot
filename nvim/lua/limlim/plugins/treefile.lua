return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")
        local function my_on_attach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set("n", "n", api.fs.create, opts("Create File Or Directory"))
            vim.keymap.set("n", "n", api.fs.create, opts("Create File Or Directory"))
            vim.keymap.set("n", "o", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "O", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "t", api.node.open.tab, opts("Up"))
        end

        require("nvim-tree").setup {
            on_attach = my_on_attach,
            disable_netrw = true,
            hijack_netrw = true,
            actions = {
                open_file = {
                    quit_on_open = true,
                }, },
            view = {
                preserve_window_proportions = true,
                side = "right",
            },
        }
        local function toggle_sidebar()
            -- If tree is already open and valid, just close it or ensure width
            if api.tree.is_visible() then
                -- If it's super wide (fullscreen), shrink it back to 30 instead of closing
                local win = vim.api.nvim_get_current_win()
                local width = vim.api.nvim_win_get_width(win)
                if width > 40 then
                    api.tree.resize({ width = 30 })
                else
                    api.tree.close()
                end
            else
                api.tree.open()
                api.tree.resize({ width = 30 })
            end
        end

        local function toggle_fullscreen()
            local screen_w = vim.opt.columns:get()

            if api.tree.is_visible() then
                local win = vim.api.nvim_get_current_win()
                local width = vim.api.nvim_win_get_width(win)
                if width < 40 then
                    api.tree.resize({ width = screen_w })
                else
                    api.tree.close()
                end
            else
                api.tree.open()
                api.tree.resize({ width = screen_w })
            end
        end

        local function copy_marked_files()
            local marks = api.marks.get()
            if #marks == 0 then
                print("No files marked")
                return
            end
        end
        vim.keymap.set('n', 'bc', copy_marked_files)
        vim.keymap.set("n", "<leader>e", toggle_sidebar)
        vim.keymap.set("n", "<leader>pv", toggle_fullscreen)
    end,
}
