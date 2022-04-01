local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local helpers = require("helpers")
local dpi = xresources.apply_dpi

screen.connect_signal("request::desktop_decoration", function(s)
    local mytextclock = wibox.widget {
        font = beautiful.font_name .. "bold 14",
        format = "%l:%M",
        align = "center",
        valign = "center",
        widget = wibox.widget.textclock
    }

    local clock = wibox.widget{
        {
            {
                mytextclock,
                spacing = dpi(5),
                layout = wibox.layout.fixed.horizontal
            },
            left = dpi(5),
            right = dpi(5),
            widget = wibox.container.margin
        },
        bg = beautiful.lighter_bg,
        shape = helpers.rect(),
        widget = wibox.container.background
    }

    local stats = wibox.widget{
        {
            clock,
            spacing = dpi(5),
            layout = wibox.layout.fixed.horizontal
        },
        bg = beautiful.bg_normal,
        shape = helpers.rect(),
        widget = wibox.container.background
    }

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = { shape = helpers.rect() },
        layout  = { spacing = 0, layout = wibox.layout.fixed.horizontal },
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        },
        widget_template = {
            {
                {
                    id = "text_role",
                    widget = wibox.widget.textbox
                },
                top = 2,
                bottom = 2,
                left = 10,
                right = 10,
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background,
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
        height   = dpi(30),
        ontop    = true,
        visible  = true,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                --mylauncher,
                s.mytaglist,
                s.mypromptbox,
            },
            nil,
            --s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                stats,
                --s.mylayoutbox,
            },
        }
    }
end)
