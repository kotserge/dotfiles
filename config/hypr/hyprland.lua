-------------------------- Basics -------------------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

hl.env("XCURSOR_SIZE", "12")
hl.env("HYPRCURSOR_SIZE", "12")

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },

    master = {
        new_status = "master",
    },
})

-------------------------- Style -------------------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = "rgba(ebdbb3aa)",
            inactive_border = "rgba(151515aa)",
        },

        resize_on_border = true,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 7,
        rounding_power = 2,

        shadow = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
    },

    group = {
        col = {
            border_active   = "rgba(ebdbb3aa)",
            border_inactive = "rgba(151515aa)",
        },

        groupbar = {
            render_titles  = false,
            keep_upper_gap = false,
            gaps_in        = 15,
            gaps_out       = 5,

            col = {
                active   = "rgba(ebdbb3aa)",
                inactive = "rgba(15151577)",
            },
        },
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("overshoot",      { type = "bezier", points = { {0.13, 0.99}, {0.29, 1.02} } })

hl.animation({ leaf = "layers",     enabled = true, speed = 20, bezier = "overshoot",    style = "fade" })
hl.animation({ leaf = "windows",    enabled = true, speed = 5,  bezier = "overshoot",    style = "slide" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade",       enabled = true, speed = 10, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "overshoot",    style = "slide" })

-------------------------- Programs -------------------------------

local terminal = "alacritty"
local menu     = "rofi -show drun"

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("$HOME/.config/waybar/launch.sh")
end)

-------------------------- Input -------------------------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-------------------------- Keybindings -------------------------------

local mainMod = "SUPER"

-------------------------- Keybindings: Touchpad -------------------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen", mode = "maximize" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })

-------------------------- Keybindings: Workspace -------------------------------

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-------------------------- Keybindings: Window -------------------------------

-- Move focus with mainMod + hjkl (vim-style, from i3)
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Move windows with mainMod + Shift + hjkl (from i3)
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))

-- Split direction: period = horizontal, comma = vertical (from i3)
hl.bind(mainMod .. " + period", hl.dsp.layout("preselect r"))
hl.bind(mainMod .. " + comma",  hl.dsp.layout("preselect d"))

-- Toggle layout split (from i3: mod+e)
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"))

-- Fullscreen toggle (from i3: mod+m)
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Kill active window (from i3: mod+shift+q)
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())

-- Toggle floating (from i3: mod+shift+f)
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

-- Toggle pseudotiling
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Toggle Group
hl.bind(mainMod .. " + g",   hl.dsp.group.toggle())
hl.bind(mainMod .. " + tab", hl.dsp.group.next())

-- Resize submap (from i3 resize mode)
hl.define_submap("resize", function()
    hl.bind("h", hl.dsp.window.resize({ x = -40, y = 0,   relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0,   y = 40,  relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0,   y = -40, relative = true }), { repeating = true })
    hl.bind("l", hl.dsp.window.resize({ x = 40,  y = 0,   relative = true }), { repeating = true })
    hl.bind("Return",          hl.dsp.submap("reset"))
    hl.bind("Escape",          hl.dsp.submap("reset"))
    hl.bind(mainMod .. " + R", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-------------------------- Keybindings: Applications -------------------------------

-- Terminal
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

-- Launcher
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

-- Screenshot (grim)
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

-- Lockscreen
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("sh $HOME/.local/bin/lock"))

-- Dunst notification history (from i3: mod+space)
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("dunstctl history-pop"))

-- Hyprland session management
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.reload_config())
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.reload_config())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
