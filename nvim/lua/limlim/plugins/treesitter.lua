-- File: nvim/lua/limlim/plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            ts.setup({})
            -- File: nvim/lua/limlim/plugins/treesitter.lua

            -- TỰ ĐỘNG BẬT MÀU (Bản cập nhật chống lỗi .conf)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local ft = vim.bo.filetype
                    local bt = vim.bo.buftype

                    -- 1. Bỏ qua các buffer đặc biệt (terminal, prompt, etc.)
                    if bt ~= "" then return end

                    -- 2. DANH SÁCH ĐEN mở rộng (Thêm 'conf' và các loại file hệ thống)
                    local ignore = {
                        "alpha", "yazi", "NvimTree", "lazy", "mason",
                        "TelescopePrompt", "noice", "notify", "toggleterm",
                        "conf", "gitconfig", "sshconfig", "zsh"
                    }
                    for _, v in ipairs(ignore) do
                        if ft == v then return end
                    end

                    -- 3. KIỂM TRA VÀ CHẠY
                    local lang = vim.treesitter.language.get_lang(ft)
                    if lang then
                        -- Bọc trực tiếp lệnh start vào pcall để chặn đứng assertion error từ core
                        pcall(function()
                            vim.treesitter.start()
                        end)
                    end
                end,
            })

            ts.install({ "lua", "python", "go", "rust", "markdown", "markdown_inline", "vim", "vimdoc", "query" })
        end,
    },
}
