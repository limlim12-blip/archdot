return {
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "folke/trouble.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            local builtin = require('telescope.builtin')
            local trouble = require("trouble.sources.telescope")
            require('telescope').setup({
                defaults = {
                    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    layout_strategy = 'horizontal',
                    layout_config = {
                        width = 0.95,
                        horizontal = {
                            preview_width = 0.5,
                            mirror = false,
                        },
                        vertical = {
                        },
                        center = {
                            width = 0.5,
                        }
                    },
                    mappings = {
                        i = {
                            ["<c-f>"] = trouble.open,
                            ["<C-c>"] = require('telescope.actions').close,
                        },
                        n = {
                            ["<c-f>"] = trouble.open,
                            ["<C-c>"] = require('telescope.actions').close,
                        },
                    }
                }
            })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Git Files' })
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fh', function()
                builtin.find_files({ hidden = true })
            end, { desc = 'Find Files (Including Hidden)' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
