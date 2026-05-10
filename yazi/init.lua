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

function Status:name()
    local h = self._tab.current.hovered
    if not h then
        return ui.Line({})
    end
    return ui.Line(" " .. tostring(h.url))
end

Status:children_add(function()
    local h = cx.active.current.hovered
    if not h or ya.target_family() ~= "unix" then
        return ""
    end

    return ui.Line {
        ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
        ":",
        ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
        " ",
    }
end, 500, Status.RIGHT)
