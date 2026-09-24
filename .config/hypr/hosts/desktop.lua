hl.monitor({
    output = "HDMI-A-2",
    mode = "2560x1440@59.95",
    position = "0x0",
    scale = "1.25",
    transform = 1,
})

hl.monitor({
    output = "DP-2",
    mode = "2560x1440@120",
    position = "1152x477",
    scale = "1",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("xrandr --output DP-2 --primary")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all && /usr/libexec/xdg-desktop-portal -r")
    hl.exec_cmd("systemctl --user start filechooser-portal.service")
    hl.exec_cmd("~/bin/zzz-overlay > /tmp/zzz-overlay.log 2>&1")
end)

hl.config({
    cursor = {
        default_monitor = "DP-2",
    },
})

hl.workspace_rule({ workspace = "1", monitor = "DP-2", default_name = "λ", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", default_name = "β" })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", default_name = "γ" })
hl.workspace_rule({ workspace = "6", monitor = "DP-2", default_name = "Ψ" })

hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-2", default_name = "δ", default = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-2", default_name = "ε" })

hl.window_rule({
    name = "windowrule-14",
    match = { class = "^(discord)$" },
    workspace = "5",
    monitor = "HDMI-A-2",
})

hl.window_rule({
    name = "windowrule-15",
    match = { class = "^(teams-for-linux)$" },
    workspace = "5",
    monitor = "HDMI-A-2",
})

hl.bind("SUPER + ALT + S", hl.dsp.workspace.move({ monitor = "HDMI-A-2" }))
hl.bind("SUPER + ALT + D", hl.dsp.workspace.move({ monitor = "DP-2" }))
