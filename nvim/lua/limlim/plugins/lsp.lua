return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("mason").setup({})

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "clangd",
                    "marksman"
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                    end,

                    ["pyright"] = function()
                        require("lspconfig").pyright.setup({
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = {
                                        typeCheckingMode = "standard",

                                        autoSearchPaths = true,
                                        useLibraryCodeForTypes = true,
                                    },
                                },
                            },
                        })
                    end,

                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { "vim" } }
                                }
                            }
                        })
                    end,
                },
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
                    vim.keymap.set("n", "<leader>gn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if client:supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
            })

            -- Hover documentation
            vim.keymap.set('n', 'K', function()
                vim.lsp.buf.hover({ border = "rounded" })
            end, { desc = "Hover Documentation" })

            -- Signature help
            vim.keymap.set('i', '<C-k>', function()
                vim.lsp.buf.signature_help({ border = "rounded" })
            end, { desc = "Signature Help" })

            local cmp = require("cmp")
            cmp.setup({
                sources = { { name = "nvim_lsp" } },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-y>"] = cmp.config.disable,
                    ["<C-e>"] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                    ["<CR>"] = cmp.mapping.confirm { select = false },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then cmp.select_next_item() else fallback() end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then cmp.select_prev_item() else fallback() end
                    end, { "i", "s" }),
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
            })
        end,
    }
}
