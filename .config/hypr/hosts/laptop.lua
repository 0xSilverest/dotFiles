hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

hl.config({
    cursor = {
        default_monitor = "eDP-1",
    },
})

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default_name = "λ", default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", default_name = "β" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", default_name = "γ" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", default_name = "δ" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", default_name = "ε" })
hl.workspace_rule({ workspace = "6", monitor = "eDP-1", default_name = "Ψ" })

hl.window_rule({
    name = "windowrule-14",
    match = { class = "^(discord)$" },
    workspace = "5",
})

hl.window_rule({
    name = "windowrule-15",
    match = { class = "^(teams-for-linux)$" },
    workspace = "5",
})
