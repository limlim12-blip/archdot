return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
        -- This ensures ==text== is rendered visually
        anti_conceal = { enabled = true },
        highlight = {
            -- This maps Obsidian's == to a background color
            enabled = true,
        },
    },
    ft = { 'markdown', 'obsidian' }, -- Only load for markdown files
}
