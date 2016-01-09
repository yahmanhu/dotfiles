--  Yahman's Awesome Theme

theme = {}

--  Font

theme.font      = "Sans Bold 8"
--theme.font      = "Terminus 10"
--theme.font      = "Perfect DOS VGA 437 11"
--theme.font      = "Ubuntu Mono derivative Powerline Bold 10"

--  Colors

-- Ubuntu colors
theme.bg_normal  = "#454343"
theme.fg_normal  = "#FFFFFF"

theme.bg_focus   = "#FF8C00"
theme.fg_focus   = "#000000"

theme.bg_urgent  = "#DC0000"
theme.fg_urgent  = "#FFFFFF"


-- Other colors

--theme.bg_normal  = "#2F4F4F"
--theme.bg_normal  = "#D3D3D3"
--
--theme.fg_normal  = "#FFFFFF"
--theme.fg_normal  = "#000000"
--
--theme.bg_focus   = "#A9A9A9"
--theme.bg_focus   = "#4169E1"
--theme.bg_focus   = "#20EC11"

--theme.bg_urgent  = "#DCC939"
--theme.bg_systray = theme.bg_normal

--  Tasklist

    -- Normal
theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_fg_normal = "#BEBEBE"
    -- Focus
theme.tasklist_bg_focus = theme.bg_normal
theme.tasklist_fg_focus = "#FFFFFF"

--  Titlebars

    -- Normal
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_normal = theme.fg_normal
    -- Focus
theme.titlebar_bg_focus  = theme.bg_focus 
theme.titlebar_fg_focus = theme.fg_focus

--  Tooltip

theme.tooltip_bg_color = "#000000"
theme.tooltip_fg_color = "#FFFFFF"
theme.tooltip_font = "Sans 10"

--  Menu

theme.menu_height = 25
theme.menu_width  = 200
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

--  Borders

theme.border_width  = 0
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"


--  OTHER STUFF

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"

--  Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#5FE36C"
--theme.border_widget    = "#5FE36C"

--  Mouse finder

--theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]

-- Taglist  icons

theme.taglist_squares_sel   = "~/.config/awesome/themes/yahman/taglist/squarefz.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/yahman/taglist/squarez.png"
--theme.taglist_squares_resize = "false"

--  Misc icons

theme.awesome_icon           = "~/.config/awesome/themes/yahman/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"

--  Layout icons

theme.layout_tile       = "~/.config/awesome/themes/yahman/layouts/tile.png"
theme.layout_tileleft   = "~/.config/awesome/themes/yahman/layouts/tileleft.png"
theme.layout_tilebottom = "~/.config/awesome/themes/yahman/layouts/tilebottom.png"
theme.layout_tiletop    = "~/.config/awesome/themes/yahman/layouts/tiletop.png"
theme.layout_fairv      = "~/.config/awesome/themes/yahman/layouts/fairv.png"
theme.layout_fairh      = "~/.config/awesome/themes/yahman/layouts/fairh.png"
theme.layout_spiral     = "~/.config/awesome/themes/yahman/layouts/spiral.png"
theme.layout_dwindle    = "~/.config/awesome/themes/yahman/layouts/dwindle.png"
theme.layout_max        = "~/.config/awesome/themes/yahman/layouts/max.png"
theme.layout_fullscreen = "~/.config/awesome/themes/yahman/layouts/fullscreen.png"
theme.layout_magnifier  = "~/.config/awesome/themes/yahman/layouts/magnifier.png"
theme.layout_floating   = "~/.config/awesome/themes/yahman/layouts/floating.png"

--  Titlebar icons

theme.titlebar_close_button_focus  = "~/.config/awesome/themes/yahman/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "~/.config/awesome/themes/yahman/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/yahman/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/yahman/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/yahman/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/yahman/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/yahman/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/yahman/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/yahman/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/yahman/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/yahman/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/yahman/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/yahman/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/yahman/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/yahman/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/yahman/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/yahman/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/yahman/titlebar/maximized_normal_inactive.png"

return theme
