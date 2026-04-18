-- ~/.config/yazi/init.lua

-- use the default settings
require("easyjump"):setup()
require("zoxide"):setup { update_db = true }
-- or customize the settings
require("easyjump"):setup({
    icon_fg = "#94e2d5",      -- color for hint labels
    first_key_fg = "#45475a", -- color for first char of double-key hints
})

require("starship"):setup()
