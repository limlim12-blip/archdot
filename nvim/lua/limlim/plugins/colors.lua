return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        function ColorMyPencils(color)
            color = color or "rose-pine"
            vim.cmd.colorscheme(color)
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

            vim.api.nvim_set_hl(0, "Search", { bg = "#2c313a", fg = "#61afef" })

            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#282c34" })
            vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#abb2bf", bg = "#282c34" })
            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "none", bg = "none" })
        end

        -- Call the function to apply the theme
        ColorMyPencils()
    end
}
