return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.1',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local builtin = require('telescope.builtin')
        require('telescope').setup({
            defaults = {
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                layout_strategy = 'horizontal',
                layout_config = {
                    width = 0.9,
                    height = 0.9,
                    preview_width = 0.5,
                },
                mappings = {
                    i = {
                        -- "i" stands for Insert mode
                        ["<C-c>"] = require('telescope.actions').close,
                    },
                    n = {
                        -- "n" stands for Normal mode
                        ["<C-c>"] = require('telescope.actions').close,
                    },
                }
            }
        })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git Files' })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
}
