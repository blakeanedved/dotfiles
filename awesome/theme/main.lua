---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

--local gfs = require("gears.filesystem")
--local themes_path = gfs.get_themes_dir()
local awesome_path = "$HOME/.config/awesome/"

local theme = {}

theme.font_name     = "FiraCode Nerd Font "
theme.font          = theme.font_name .. "8"
theme.taglist_font  = theme.font_name .. "14"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap         = dpi(6)
theme.border_width        = dpi(2)
theme.border_color_normal = "#000000"
theme.border_color_active = "#535d6c"
theme.border_color_marked = "#91231c"

theme.lighter_bg = "#162026"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
--local taglist_square_size = dpi(4)
--theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    --taglist_square_size, theme.fg_normal
--)
--theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    --taglist_square_size, theme.fg_normal
--)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = awesome_path.."theme/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = awesome_path.."theme/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = awesome_path.."theme/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = awesome_path.."theme/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = awesome_path.."theme/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = awesome_path.."theme/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = awesome_path.."theme/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = awesome_path.."theme/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = awesome_path.."theme/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = awesome_path.."theme/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = awesome_path.."theme/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = awesome_path.."theme/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = awesome_path.."theme/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = awesome_path.."theme/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = awesome_path.."theme/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = awesome_path.."theme/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = awesome_path.."theme/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = awesome_path.."theme/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = awesome_path.."theme/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = awesome_path.."theme/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = awesome_path.."theme/titlebar/maximized_focus_active.png"

theme.wallpaper = awesome_path.."theme/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = awesome_path.."theme/layouts/fairhw.png"
theme.layout_fairv = awesome_path.."theme/layouts/fairvw.png"
theme.layout_floating  = awesome_path.."theme/layouts/floatingw.png"
theme.layout_magnifier = awesome_path.."theme/layouts/magnifierw.png"
theme.layout_max = awesome_path.."theme/layouts/maxw.png"
theme.layout_fullscreen = awesome_path.."theme/layouts/fullscreenw.png"
theme.layout_tilebottom = awesome_path.."theme/layouts/tilebottomw.png"
theme.layout_tileleft   = awesome_path.."theme/layouts/tileleftw.png"
theme.layout_tile = awesome_path.."theme/layouts/tilew.png"
theme.layout_tiletop = awesome_path.."theme/layouts/tiletopw.png"
theme.layout_spiral  = awesome_path.."theme/layouts/spiralw.png"
theme.layout_dwindle = awesome_path.."theme/layouts/dwindlew.png"
theme.layout_cornernw = awesome_path.."theme/layouts/cornernww.png"
theme.layout_cornerne = awesome_path.."theme/layouts/cornernew.png"
theme.layout_cornersw = awesome_path.."theme/layouts/cornersww.png"
theme.layout_cornerse = awesome_path.."theme/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
