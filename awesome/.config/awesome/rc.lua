-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")


--  Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- 

--  Autostart
-- Start compton
awful.util.spawn_with_shell("compton --backend glx --paint-on-overlay --vsync opengl-swc")


--  Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/themes/yahman/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- 

--  Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- 

--  Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 'web', 'terminal', 'files', 'torrent', 'music', "office", 7, 8, 9 }, s, layouts[1])
end
-- 

--  Menu
--   Menu variables
switch_keybaord = function() awful.util.spawn("/home/rio/bin/switch-keyboard") end
switch_wifi = function() awful.util.spawn("/home/rio/bin/switch-wifi") end
switch_monitor = function() awful.util.spawn("/home/rio/bin/switch-monitor") end

logout = function() awful.util.spawn("pkill -u rio") end
suspend = function() awful.util.spawn("systemctl suspend") end
reboot = function() awful.util.spawn("systemctl reboot") end
poweroff = function() awful.util.spawn("systemctl poweroff") end

gnome_disks = function() awful.util.spawn("gnome-disks") end
usb_creator = function() awful.util.spawn("gksudo usb-creator-gtk") end
unetbootin = function() awful.util.spawn("unetbootin") end

printer_config = function() awful.util.spawn("system-config-printer") end

tpfan = function() awful.util.spawn("sudo tpfan-admin") end

mymainmenu = awful.menu({ items = { {"K&eyboard switcher", switch_keybaord},
                                    {"&Wifi switcher", switch_wifi},
                                    {"&Monitor switcher", switch_monitor},
                                    {},
                                    {"&Gnome Disks", gnome_disks},
                                    {"&USB Creator", usb_creator},
                                    {"Unet&bootin", unetbootin},
                                    {"&TPFan", tpfan},
                                    {"Printer &Config", printer_config},
                                    {},
                                    {"&Logout", logout},
                                    {"&Reboot", reboot},
                                    {"&Suspend", suspend},
                                    {"&Poweroff", poweroff},
                                  }
                        })

mylauncher = awful.widget.launcher({ menu = mymainmenu })

-- 

-- Battery indicator widget
battwidget = wibox.widget.textbox()

function Battery_widget()
    local file = io.open("/sys/class/power_supply/BAT0/status", "r")
    batstat = file:read()
    file:close()
    local file = io.open("/sys/class/power_supply/BAT0/capacity", "r")
    batcap = file:read()
    file:close()

    if (batstat == "Discharging") then
        if (batcap <= "30") then
        battwidget:set_markup('<span color="#DC0000">'.. batstat.." ".. '</span>'.. '<span color="#FFFFFF">'.. batcap.."% "..'</span>')
        else
        battwidget:set_markup('<span color="#848484">'.. batstat.." ".. '</span>'.. '<span color="#FFFFFF">'.. batcap.."% "..'</span>')
        end
    else
        battwidget:set_markup('<span color="#00FF00">'.. batstat.." ".. '</span>'.. '<span color="#FFFFFF">'.. batcap.."% "..'</span>')
end
end

Battery_widget()
battery_timer = timer({timeout=60})
battery_timer:connect_signal("timeout",Battery_widget)
battery_timer:start()

-- Wi-Fi connection widget
wifi_widget= wibox.widget.textbox()

function Wifi()
    wifistat_file = io.open("/sys/class/net/wlp3s0/operstate", "r")
    wifistat = wifistat_file:read()
    wifistat_file:close()

    if (wifistat == "up") then
        wifi_widget:set_markup('<span color="#FFA500">Wi-Fi</span>')
    else
        wifi_widget:set_markup('<span color="#848484">Wi-Fi</span>')
    end
end

Wifi()

wifi_timer = timer({timeout=10})
wifi_timer:connect_signal("timeout",Wifi)
wifi_timer:start()

-- Ethernet connection widget
ethernet_widget = wibox.widget.textbox()

function Ethernet()
    ethstat_file = io.open("/sys/class/net/enp4s0/operstate", "r")
    ethstat = ethstat_file:read()
    ethstat_file:close()

    if (ethstat == "up") then
        ethernet_widget:set_markup('<span color="#00BFFF">Wired Connection</span>')
    else
        ethernet_widget:set_markup('<span color="#848484">Wired Connection</span>')
    end
end
Ethernet()

eth_timer = timer({timeout=10})
eth_timer:connect_signal("timeout",Ethernet)
eth_timer:start()

-- Volume indicator wiget
volume_widget = wibox.widget.textbox()

function Vol_widget()

    local volstat_command = io.popen("amixer get Master | egrep Playback | egrep -o off")
    local volstat = volstat_command:read("*a")
    volstat_command:close()

    local vol_value_command = io.popen("amixer get Master | egrep Playback | egrep -o '[^[]*%'")
    local vol_value = vol_value_command:read()
    vol_value_command:close()

    if string.find(volstat, "off") then
        volume_widget:set_markup('<span color="#C3C3C3">Volume</span>')
    else
        volume_widget:set_markup('<span color="#000000">Volume</span>')
    end
end

--Vol_widget()

-- Clock and calendar widget
clockcal_widget = wibox.widget.textbox()

function Clockcal()
    --clockcal_widget:set_markup('<span color="#FFFFFF">' .. os.date("%A %B %d  %H:%M") .. '</span>')
    clockcal_widget:set_markup('<span color="#FF6347">' .. os.date("%H:%M") .. '</span>')
end

clockcal_tooltip = awful.tooltip({ objects = { clockcal_widget } })

clockcal_widget:connect_signal("mouse::enter", function() clockcal_tooltip:set_text(os.date("%A %B %d %Y")) end)

Clockcal()

clockcal_timer = timer({timeout=60})
clockcal_timer:connect_signal("timeout",Clockcal)
clockcal_timer:start()

-- Separator widget
--
separator_widget = wibox.widget.textbox()

function Separator_widget()
        separator_widget:set_markup('<span color="#5FE36C">  |  </span>')
end
Separator_widget()

--  Wibox
-- Create a textclock widget
--mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mywibox2 = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, })
    mywibox2[s] = awful.wibox({ position = "bottom", screen = s, })

    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(battwidget)
    right_layout:add(separator_widget)
    right_layout:add(ethernet_widget)
    right_layout:add(separator_widget)
    right_layout:add(wifi_widget)
    right_layout:add(separator_widget)
    right_layout:add(clockcal_widget)
    right_layout:add(separator_widget)

    local bottom_layout = wibox.layout.flex.horizontal()
    bottom_layout:add(mytasklist[s])

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle()
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
    mywibox2[s]:set_widget(bottom_layout)

end
-- 

--  Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- 

--  Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, ",",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, ".",   awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({                   }, "XF86AudioMute", function () Vol_widget() end),
    awful.key({                   }, "XF86AudioMute", function () awful.util.spawn("amixer sset Master toggle") end),
    awful.key({                   }, "XF86AudioLowerVolume", function () Vol_widget() end),
    awful.key({                   }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer -M sset Master 5%-") end),
    awful.key({                   }, "XF86AudioRaiseVolume", function () Vol_widget() end),
    awful.key({                   }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer -M sset Master 5%+") end),
    awful.key({                   }, "Pause", function () awful.util.spawn("xset dpms force off") end),
    awful.key({                   }, "XF86Back", function () awful.util.spawn("xbacklight -time 0 -dec 10%") end),
    awful.key({                   }, "XF86Forward", function () awful.util.spawn("xbacklight -time 0 -inc 15%") end),
    awful.key({                   }, "XF86PowerOff", function () awful.util.spawn("sudo pm-suspend") end),
    awful.key({ modkey,           }, "h",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "l",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "Menu", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey, "Control" }, "t", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "b", function () awful.util.spawn("firefox") end),
    awful.key({ modkey, "Control" }, "e", function () awful.util.spawn(editor_cmd) end),
    awful.key({ modkey, "Control" }, "f", function () awful.util.spawn("urxvt -T ranger -e ranger") end),
    awful.key({ modkey, "Control" }, "s", function () awful.util.spawn("spotify --ui.track_notifications_enabled=false") end),
    awful.key({ modkey, "Control" }, "d", function () awful.util.spawn("urxvt -T Transmission -e transmission-remote-cli") end),
    awful.key({ modkey, "Control" }, "o", function () awful.util.spawn("libreoffice") end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Control" }, "q", awesome.quit),

    awful.key({ modkey,           }, "j",     function () awful.tag.incmwfact( 0.1)    end),
    awful.key({ modkey,           }, "k",     function () awful.tag.incmwfact(-0.1)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Chane tty
    awful.key({ modkey,           }, "F2", function () awful.util.spawn("sudo chvt 2") end),
    awful.key({ modkey,           }, "F3", function () awful.util.spawn("sudo chvt 3") end),
    awful.key({ modkey,           }, "F4", function () awful.util.spawn("sudo chvt 4") end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end)

    --awful.key({ modkey }, "x",
              --function ()
                  --awful.prompt.run({ prompt = "Run Lua code: " },
                  --mypromptbox[mouse.screen].widget,
                  --awful.util.eval, nil,
                  --awful.util.getdir("cache") .. "/history_eval")
              --end)
)

clientkeys = awful.util.table.join(
    --awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            ---- The client currently has the input focus, so it cannot be
            ---- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- 

--  Rules
-- Rules to apply to new clients (through the "manage" signal).
-- 
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     size_hints_honor = false } },
    { rule_any = { class = { "mpv", "Tpfan-admin", "Gcolor2", "Zathura"} },
      properties = { floating = true } },
    { rule_any = { class = { "Gnome-disks", "Usb-creator-gtk", "Unetbootin", "feh" } },
      properties = { floating = true },
      callback = function (c) c:geometry({width = 800, height=500}) end },
    { rule = { class = "System-config-printer.py"},
      properties = { floating = true },
      callback = function (c) c:geometry({width = 200, height=200}) end },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][1] } },
    --{ rule = { class = "URxvt" },
      --properties = { tag = tags [1][2] } },
    { rule = { name = "ranger" },
      properties = { tag = tags [1][3] } },
    { rule = { name = "Transmission" },
      properties = { tag = tags [1][4] } },
    { rule = { name = "Spotify" },
      properties = { tag = tags [1][5] } },
    { rule = { class = "libreoffice-startcenter" },
      properties = { tag = tags [1][6] } },
}

--  Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = true
    if titlebars_enabled and (c.class == "mpv" or
                              c.class == "Gnome-disks" or
                              c.lass == "Usb-creator-gtk" or
                              c.class == "Unetbootin" or
                              c.class == "System-config-printer.py" or
                              c.class == "Tpfan-admin" or
                              c.class == "feh" or
                              c.class == "Gcolor2" or
                              c.class == "Zathura")
                         then

        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        ---- Widgets that are aligned to the left
        --local left_layout = wibox.layout.fixed.horizontal()
        --left_layout:add(awful.titlebar.widget.iconwidget(c))
        --left_layout:buttons(buttons)

        ---- Widgets that are aligned to the right
        --local right_layout = wibox.layout.fixed.horizontal()
        --right_layout:add(awful.titlebar.widget.floatingbutton(c))
        --right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        --right_layout:add(awful.titlebar.widget.stickybutton(c))
        --right_layout:add(awful.titlebar.widget.ontopbutton(c))
        --right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        --layout:set_left(left_layout)
        --layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

--  Notification border color
naughty.config.defaults.border_color = "#000000"
