hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

require("hosts.local")

hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("VK_ICD_FILENAMES", "/usr/share/vulkan/icd.d/nvidia_icd.x86_64.json")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("dunst")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("easyeffects --gapplication-service")
    hl.exec_cmd("mpd")
    hl.exec_cmd("clipse -listen")
end)

-- hl.exec_cmd('mpvpaper -o "loop-file=inf --hwdec=nvdec --gpu-context=wayland --no-audio" HDMI-A-2 /home/silverest/Pictures/alice_thymefield.mp4')
-- hl.exec_cmd('mpvpaper -o "loop-file=inf --hwdec=nvdec --gpu-context=wayland --no-audio" DP-2 /home/silverest/Pictures/night_city_2_1440p.mp4')
-- hl.exec_cmd("~/.config/hypr/scripts/dual-wallpaper.sh")

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 2,
        mouse_refocus = false,

        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
            tap_to_click = true,
            drag_lock = true,
        },

        sensitivity = 0,
        accel_profile = "flat",
    },
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,

        col = {
            active_border = "rgb(3D3659)",
            inactive_border = "rgb(292D3E)",
        },

        layout = "master",
        allow_tearing = false,
        resize_on_border = true,
        extend_border_grab_area = 15,
        hover_icon_on_border = true,
    },
})

hl.config({
    decoration = {
        rounding = 12,

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },
})

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6, bezier = "default", style = "slidevert" })

hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
        split_width_multiplier = 1.0,
    },
})

hl.config({
    master = {
        new_status = "master",
        new_on_top = false,
        orientation = "left",
        smart_resizing = true,
        drop_at_cursor = true,
        allow_small_split = false,
        special_scale_factor = 0.95,
        mfact = 0.55,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_autoreload = false,
        focus_on_activate = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        always_follow_on_dnd = true,
        layers_hog_keyboard_focus = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        enable_swallow = false,
        middle_click_paste = false,
        initial_workspace_tracking = 1,
    },
})

hl.config({
    cursor = {
        no_hardware_cursors = true,
        no_break_fs_vrr = false,
        min_refresh_rate = 24,
        hotspot_padding = 1,
        inactive_timeout = 3,
        no_warps = true,
        persistent_warps = false,
        warp_on_change_workspace = false,
        zoom_factor = 1.0,
        zoom_rigid = false,
    },
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.workspace_rule({ workspace = "special:dropdown", gaps_out = 60, gaps_in = 10 })

hl.window_rule({
    name = "windowrule-1",
    match = { class = "^(clipse-floating)$" },
    float = true,
    size = { 800, 600 },
    center = true,
})

hl.window_rule({
    name = "windowrule-2",
    match = { class = "^(jetbrains-.*)$", float = false },
    no_initial_focus = true,
})

hl.window_rule({
    name = "windowrule-3",
    match = { title = "^(mpv)$" },
    float = true,
})

hl.window_rule({
    name = "windowrule-4",
    match = { title = "^(Downloads)$" },
    float = true,
})

hl.window_rule({
    name = "windowrule-5",
    match = { title = "^(Save As.*)$" },
    float = true,
})

hl.window_rule({
    name = "windowrule-6",
    match = { title = "^(Open File.*)$" },
    float = true,
})

hl.window_rule({
    name = "filechooser-portal-float",
    match = { class = "^(chooser-ui-dialog)$" },
    float = true,
})

hl.window_rule({
    name = "windowrule-7",
    match = { title = "^(Select a File.*)$" },
    float = true,
})

hl.window_rule({
    name = "windowrule-8",
    match = { title = "^(ChronoTask)$" },
    float = true,
})

hl.window_rule({
    name = "windowrule-9",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin = true,
})

hl.window_rule({
    name = "windowrule-10",
    match = { class = "^(rofi)$" },
    float = true,
    center = true,
    stay_focused = true,
    dim_around = true,
})

hl.window_rule({
    name = "windowrule-11",
    match = { class = "^(jetbrains-idea)$" },
    workspace = "2",
    opacity = "1.0 1.0",
})

hl.window_rule({
    name = "windowrule-12",
    match = { class = "^(lutris)$" },
    workspace = "3",
})

hl.window_rule({
    name = "windowrule-13",
    match = { class = "^(steam)$" },
    workspace = "3",
})

hl.window_rule({
    name = "windowrule-16",
    match = { class = "^(thunderbird-esr)$" },
    workspace = "5",
})

hl.window_rule({
    name = "windowrule-17",
    match = { class = "^(thunderbird)$" },
    workspace = "5",
})

hl.window_rule({
    name = "windowrule-18",
    match = { class = "^(desktop_window)$" },
    workspace = "special:ignore",
})

hl.window_rule({
    name = "windowrule-19",
    match = { class = "^(dunst)$" },
    workspace = "special:ignore",
})

hl.window_rule({
    name = "windowrule-20",
    match = { title = "^(Timer)$" },
    workspace = "special:ignore",
})

hl.window_rule({
    name = "windowrule-21",
    match = { class = "^(kitty)$" },
    opacity = "0.95 0.95",
})

hl.window_rule({
    name = "windowrule-22",
    match = { class = "^(firefox)$" },
    opacity = "1.0 1.0",
})

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("rofi -show window"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("rofi-power-menu"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("copyq show"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("rofi-url"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))

hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("CTRL + ALT + K", hl.dsp.exec_cmd("pkill waybar; sleep 0.3; waybar"))
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("pkill waybar"))

hl.bind("CTRL + SUPER + B", hl.dsp.exec_cmd("qutebrowser"))
hl.bind("CTRL + SUPER + N", hl.dsp.exec_cmd("kitty -e nnn"))
-- hl.bind("CTRL + SUPER + T", hl.dsp.exec_cmd("hyprctl dispatch togglefloating"))

hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') - | wl-copy"))
hl.bind("SUPER + SHIFT + Print", hl.dsp.exec_cmd("grim - | wl-copy"))

hl.bind("CTRL + XF86AudioMute", hl.dsp.exec_cmd("change-audio-output"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("smart-playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("smart-playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("smart-playerctl previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("smart-playerctl stop"))

hl.bind("SUPER + Space", hl.dsp.layout("orientationnext"))
hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + J", hl.dsp.layout("cyclenext"))
hl.bind("SUPER + K", hl.dsp.layout("cycleprev"))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

hl.bind("SUPER + SHIFT + M", hl.dsp.layout("focusmaster"))
hl.bind("CTRL + SUPER + M", hl.dsp.layout("swapwithmaster"))
hl.bind("CTRL + SUPER + H", hl.dsp.layout("mfact -0.1"))
hl.bind("CTRL + SUPER + L", hl.dsp.layout("mfact +0.1"))

hl.bind("CTRL + SUPER + T", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind("SUPER + P", hl.dsp.window.pseudo())
-- hl.bind("SUPER + V", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + V", hl.dsp.exec_cmd('kitty --class="clipse-floating" -e clipse'))

hl.bind("SUPER + Return", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + SHIFT + Return", hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + F9", hl.dsp.focus({ workspace = 6 }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + F9", hl.dsp.window.move({ workspace = 6 }))

hl.bind("SUPER + CTRL + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind("SUPER + CTRL + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind("SUPER + CTRL + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind("SUPER + CTRL + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind("SUPER + CTRL + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind("SUPER + CTRL + F9", hl.dsp.window.move({ workspace = 6, follow = false }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + mouse:274", hl.dsp.layout("focusmaster"))

hl.bind("SUPER + grave", hl.dsp.workspace.toggle_special("dropdown"))
hl.bind("SUPER + SHIFT + grave", hl.dsp.window.move({ workspace = "special:dropdown" }))

hl.bind("SUPER + M", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + S", hl.dsp.focus({ monitor = "l" }))
hl.bind("SUPER + D", hl.dsp.focus({ monitor = "r" }))

hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ monitor = "l" }))
hl.bind("SUPER + SHIFT + D", hl.dsp.window.move({ monitor = "r" }))

hl.bind("SUPER + CTRL + SHIFT + R", hl.dsp.exec_cmd("hyprctl keyword monitor ,preferred,auto,1"))

-- ── ChronoTask ─────────────────────────────────────────
-- SUPER+P: pick a routine and start the overlay (rofi menu).
hl.bind("SUPER + P", hl.dsp.exec_cmd('chrono-overlay "$(chrono-overlay --list | rofi -dmenu -p Routine)"'))
-- SUPER+SHIFT+P: enter timer-control mode, then press a key below; Esc/Enter exits.
hl.bind("SUPER + SHIFT + P", hl.dsp.submap("chrono"))

hl.define_submap("chrono", function()
    hl.bind("p", hl.dsp.exec_cmd("chrono-ctrl pause"))
    hl.bind("r", hl.dsp.exec_cmd("chrono-ctrl resume"))
    hl.bind("n", hl.dsp.exec_cmd("chrono-ctrl next"))
    hl.bind("b", hl.dsp.exec_cmd("chrono-ctrl previous"))
    hl.bind("e", hl.dsp.exec_cmd("chrono-ctrl extend 5"))
    hl.bind("s", hl.dsp.exec_cmd('notify-send ChronoTask "$(chrono-ctrl status)"'))
    hl.bind("a", hl.dsp.exec_cmd("chrono-ctrl abort"))
    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("Return", hl.dsp.submap("reset"))
end)
