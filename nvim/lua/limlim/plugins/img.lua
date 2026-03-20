return {
    {
        "3rd/image.nvim",
        dependencies = {
            {
                "vhyrro/luarocks.nvim",
                priority = 1001,
                opts = {
                    rocks = { "magick", "dkjson" },
                },
            },
        },
        config = function()
            require("image").setup({
                backend = "kitty",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        filetypes = { "markdown", "vimwiki" },
                    },
                    html = { enabled = false },
                    css = { enabled = false },
                },
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = true,
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
            })
        end,
    },
}
