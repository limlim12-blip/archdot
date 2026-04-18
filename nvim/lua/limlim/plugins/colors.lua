return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        function ColorMyPencils(color)
            color = color or "rose-pine"
            require("rose-pine").setup({
                variant = "auto",      -- auto, main, moon, or dawn
                dark_variant = "auto", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true,        -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                -- palette = {
                --     -- Override the builtin palette per variant
                --     moon = {
                --         base = '#18191a',
                --         overlay = '#363738',
                --     },
                -- },

                -- NOTE: Highlight groups are extended (merged) by default. Disable this
                -- per group via `inherit = false`
                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    StatusLine = { fg = "rose", bg = "rose", blend = 10 },
                    StatusLineNC = { fg = "subtle", bg = "surface" },
                    CurSearch = { fg = "base", bg = "leaf", inherit = false },
                    -- TelescopeBorder = { fg = "highlight_high", bg = "none" },
                    -- TelescopeNormal = { bg = "none" },
                    -- TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                    -- TelescopeSelection = { fg = "rose", bg = "none" },
                    -- TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                    -- TelescopePromptNormal = { bg = "none", fg = "none" },
                    Pmenu = { bg = "surface" },
                    PmenuSel = { bg = "overlay", fg = "text" },
                    FloatBorder = { fg = "muted", bg = "surface" },
                    QuickFixLine = { bg = "overlay", inherit = true },
                    NormalFloat = { bg = "base" },
                },

            })

            -- vim.api.nvim_set_hl(0, "Search", { bg = "#2c313a", fg = "#61afef" })
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#CF7272" })
            -- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "none", bg = "none" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "none", bg = "none" })
        end

        -- Call the function to apply the theme

        ColorMyPencils()
        vim.cmd("colorscheme rose-pine-main")
    end
}
