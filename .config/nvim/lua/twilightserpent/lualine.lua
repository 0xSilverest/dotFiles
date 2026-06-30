-- Twilight Serpent lualine theme — fully opaque "solid bar".
-- Every section sets an explicit bg so none fall back to the terminal's
-- translucent default background (kitty background_opacity). Mode (a) and
-- position (z, which mirrors a) carry the accent; b/c are raised surfaces.
local p = require("twilightserpent").palette

local function mode(accent)
  return {
    a = { fg = p.bg, bg = accent, gui = "bold" },
    b = { fg = p.fg, bg = p.surfaceLight },
    c = { fg = p.muted, bg = p.surface },
  }
end

return {
  normal   = mode(p.primary),
  insert   = mode(p.green),
  visual   = mode(p.yellow),
  replace  = mode(p.error),
  command  = mode(p.cyan),
  terminal = mode(p.secondary),
  inactive = {
    a = { fg = p.muted, bg = p.surface, gui = "bold" },
    b = { fg = p.muted, bg = p.surface },
    c = { fg = p.comment, bg = p.surface },
  },
}
