return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        build = ":TSUpdate",
        dependencies = {
            {
                "vhyrro/luarocks.nvim",
                priority = 1000,
                config = true,
            }
        },
        config = function()
            local ts = require('nvim-treesitter')

            ts.setup({
                highlight = { enable = true },
            })

            vim.api.nvim_create_autocmd('User', {
                pattern = 'LazyDone',
                once = true,
                callback = function()
                    ts.install({
                        'bash', 'comment', 'css', 'diff', 'fish',
                        'git_config', 'git_rebase', 'gitcommit', 'gitignore',
                        'html', 'javascript', 'json', 'latex', 'lua',
                        'luadoc', 'make', 'markdown', 'markdown_inline',
                        'python', 'query', 'regex', 'scss', 'svelte',
                        'toml', 'tsx', 'typescript', 'typst', 'vim',
                        'vimdoc', 'vue', 'xml', 'go',
                    }, {
                        max_jobs = 8,
                    })
                end,
            })
        end,
    }
}
