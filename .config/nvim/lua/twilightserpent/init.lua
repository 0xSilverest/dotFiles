local M = {}

local p = {
  -- base / surfaces
  bg            = "#181616",
  surface       = "#1A181A",
  surfaceLight  = "#2A2626",
  overlayLight  = "#363232",
  caretRow      = "#201E1E",
  indent        = "#272424",
  selectedIndent= "#2C2929",
  border        = "#292424",

  -- text
  fg            = "#E5E5E5",
  muted         = "#C7CFE0",
  lineNumber    = "#6B7D8C",
  comment       = "#5A607A",

  -- brand
  primary       = "#9C8CE6", -- purple — keywords, magenta
  secondary     = "#4A9B7F", -- teal-green — vcs/buttons

  -- accents
  blue          = "#82AAFF", -- functions, links
  pink          = "#FF8B92", -- numbers, identifiers, caret
  yellow        = "#FFCB6B", -- classes, types, attributes
  green         = "#C3E88D", -- strings
  cyan          = "#89DDFF", -- operators, tags

  -- status
  error         = "#FF3355",
  warning       = "#FF9966",
  success       = "#66CDAA",
  link          = "#58B7FF",

  -- interaction
  selection     = "#3D3659",
  selectionFocused = "#4A4169",
  hover         = "#4A4559", -- editor text selection
  active        = "#5A4F6A",

  -- derived diff backgrounds (subtle tints; not in the source sheet)
  diffAdd       = "#1B2420",
  diffChange    = "#262218",
  diffDelete    = "#2A1C1F",
  diffText      = "#33301C",

  none          = "NONE",
}
-- stylua: ignore end

M.palette = p

function M.setup()
  local hl = vim.api.nvim_set_hl

  local groups = {
    ----------------------------------------------------------------- editor UI
    Normal       = { fg = p.fg, bg = p.bg },
    NormalNC     = { fg = p.fg, bg = p.bg },
    NormalFloat  = { fg = p.fg, bg = p.surface },
    FloatBorder  = { fg = p.overlayLight, bg = p.surface },
    FloatTitle   = { fg = p.primary, bg = p.surface, bold = true },
    ColorColumn  = { bg = p.surface },
    Cursor       = { fg = p.bg, bg = p.pink },
    lCursor      = { link = "Cursor" },
    CursorLine   = { bg = p.caretRow },
    CursorColumn = { bg = p.caretRow },
    CursorLineNr = { fg = p.pink, bold = true },
    LineNr       = { fg = p.lineNumber },
    LineNrAbove  = { link = "LineNr" },
    LineNrBelow  = { link = "LineNr" },
    SignColumn   = { bg = p.bg },
    FoldColumn   = { fg = p.lineNumber, bg = p.bg },
    Folded       = { fg = p.muted, bg = p.surface },
    VertSplit    = { fg = p.border },
    WinSeparator = { fg = p.border },
    Visual       = { bg = p.hover },
    VisualNOS    = { bg = p.hover },
    Search       = { fg = p.bg, bg = p.yellow },
    IncSearch    = { fg = p.bg, bg = p.pink },
    CurSearch    = { fg = p.bg, bg = p.pink },
    Substitute   = { fg = p.bg, bg = p.error },
    MatchParen   = { fg = p.cyan, bold = true, underline = true },
    NonText      = { fg = p.comment },      -- eol/wrap markers, dim but visible
    Whitespace   = { fg = p.overlayLight }, -- listchars for spaces/tabs (kept subtle)
    SpecialKey   = { fg = p.comment },
    EndOfBuffer  = { fg = p.lineNumber },   -- the `~` tildes, visible like the gutter
    Conceal      = { fg = p.muted },
    Directory    = { fg = p.blue },
    Title        = { fg = p.primary, bold = true },
    ErrorMsg     = { fg = p.error },
    WarningMsg   = { fg = p.warning },
    ModeMsg      = { fg = p.muted },
    MoreMsg      = { fg = p.secondary },
    Question     = { fg = p.secondary },
    WinBar       = { fg = p.fg, bg = p.bg, bold = true },
    WinBarNC     = { fg = p.muted, bg = p.bg },
    QuickFixLine = { bg = p.selection },

    -- popup menu
    Pmenu        = { fg = p.fg, bg = p.surface },
    PmenuSel     = { fg = p.fg, bg = p.selectionFocused },
    PmenuSbar    = { bg = p.surfaceLight },
    PmenuThumb   = { bg = p.overlayLight },
    PmenuKind    = { fg = p.yellow, bg = p.surface },
    PmenuExtra   = { fg = p.muted, bg = p.surface },
    WildMenu     = { link = "PmenuSel" },

    -- status / tabs
    StatusLine   = { fg = p.fg, bg = p.surface },
    StatusLineNC = { fg = p.muted, bg = p.bg },
    TabLine      = { fg = p.muted, bg = p.surface },
    TabLineFill  = { bg = p.bg },
    TabLineSel   = { fg = p.fg, bg = p.bg, sp = p.primary, underline = true },

    -- spelling
    SpellBad     = { undercurl = true, sp = p.error },
    SpellCap     = { undercurl = true, sp = p.warning },
    SpellRare    = { undercurl = true, sp = p.primary },
    SpellLocal   = { undercurl = true, sp = p.cyan },

    --------------------------------------------------------------- syntax (legacy)
    Comment      = { fg = p.comment, italic = true },
    Constant     = { fg = p.pink },
    String       = { fg = p.green },
    Character    = { fg = p.green },
    Number       = { fg = p.pink },
    Float        = { link = "Number" },
    Boolean      = { fg = p.pink },
    Identifier   = { fg = p.fg },
    Function     = { fg = p.blue },
    Statement    = { fg = p.primary },
    Conditional  = { fg = p.primary },
    Repeat       = { fg = p.primary },
    Label        = { fg = p.primary },
    Operator     = { fg = p.cyan },
    Keyword      = { fg = p.primary },
    Exception    = { fg = p.primary },
    PreProc      = { fg = p.cyan },
    Include      = { fg = p.cyan },
    Define       = { fg = p.cyan },
    Macro        = { fg = p.cyan },
    PreCondit    = { fg = p.cyan },
    Type         = { fg = p.yellow },
    StorageClass = { fg = p.yellow },
    Structure    = { fg = p.yellow },
    Typedef      = { fg = p.yellow },
    Special      = { fg = p.cyan },
    SpecialChar  = { fg = p.pink },
    Tag          = { fg = p.cyan },
    Delimiter    = { fg = p.muted },
    SpecialComment = { fg = p.muted, italic = true },
    Debug        = { fg = p.error },
    Underlined   = { fg = p.link, underline = true },
    Ignore       = { fg = p.overlayLight },
    Error        = { fg = p.error },
    Todo         = { fg = p.bg, bg = p.yellow, bold = true },

    ---------------------------------------------------------------- diagnostics
    DiagnosticError = { fg = p.error },
    DiagnosticWarn  = { fg = p.warning },
    DiagnosticInfo  = { fg = p.link },
    DiagnosticHint  = { fg = p.success },
    DiagnosticOk    = { fg = p.success },
    DiagnosticUnderlineError = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = p.warning },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = p.link },
    DiagnosticUnderlineHint  = { undercurl = true, sp = p.success },
    DiagnosticVirtualTextError = { fg = p.error, bg = p.surface },
    DiagnosticVirtualTextWarn  = { fg = p.warning, bg = p.surface },
    DiagnosticVirtualTextInfo  = { fg = p.link, bg = p.surface },
    DiagnosticVirtualTextHint  = { fg = p.success, bg = p.surface },

    ------------------------------------------------------------------------ LSP
    LspReferenceText  = { bg = p.active },
    LspReferenceRead  = { bg = p.active },
    LspReferenceWrite = { bg = p.active },
    LspSignatureActiveParameter = { fg = p.pink, bold = true },
    LspInlayHint = { fg = p.lineNumber, bg = p.surface, italic = true },
    LspCodeLens  = { fg = p.comment, italic = true },

    --------------------------------------------------------- treesitter captures
    ["@variable"]            = { fg = p.fg },
    ["@variable.builtin"]    = { fg = p.pink },
    ["@variable.parameter"]  = { fg = p.fg, italic = true },
    ["@variable.member"]     = { fg = p.pink },
    ["@constant"]            = { fg = p.pink },
    ["@constant.builtin"]    = { fg = p.pink },
    ["@constant.macro"]      = { fg = p.cyan },
    ["@module"]              = { fg = p.yellow },
    ["@label"]               = { fg = p.primary },
    ["@string"]              = { fg = p.green },
    ["@string.escape"]       = { fg = p.cyan },
    ["@string.special"]      = { fg = p.cyan },
    ["@string.regexp"]       = { fg = p.cyan },
    ["@character"]           = { fg = p.green },
    ["@character.special"]   = { fg = p.cyan },
    ["@boolean"]             = { fg = p.pink },
    ["@number"]              = { fg = p.pink },
    ["@number.float"]        = { fg = p.pink },
    ["@type"]                = { fg = p.yellow },
    ["@type.builtin"]        = { fg = p.yellow },
    ["@type.definition"]     = { fg = p.yellow },
    ["@attribute"]           = { fg = p.yellow },
    ["@property"]            = { fg = p.pink },
    ["@field"]               = { fg = p.pink },
    ["@function"]            = { fg = p.blue },
    ["@function.builtin"]    = { fg = p.blue },
    ["@function.call"]       = { fg = p.blue },
    ["@function.method"]     = { fg = p.blue },
    ["@function.macro"]      = { fg = p.cyan },
    ["@constructor"]         = { fg = p.yellow },
    ["@operator"]            = { fg = p.cyan },
    ["@keyword"]             = { fg = p.primary },
    ["@keyword.function"]    = { fg = p.primary },
    ["@keyword.operator"]    = { fg = p.cyan },
    ["@keyword.return"]      = { fg = p.primary },
    ["@keyword.import"]      = { fg = p.cyan },
    ["@keyword.exception"]   = { fg = p.primary },
    ["@punctuation.delimiter"] = { fg = p.muted },
    ["@punctuation.bracket"]   = { fg = p.muted },
    ["@punctuation.special"]   = { fg = p.cyan },
    ["@comment"]             = { fg = p.comment, italic = true },
    ["@comment.error"]       = { fg = p.bg, bg = p.error },
    ["@comment.warning"]     = { fg = p.bg, bg = p.warning },
    ["@comment.todo"]        = { fg = p.bg, bg = p.yellow },
    ["@comment.note"]        = { fg = p.bg, bg = p.link },
    ["@tag"]                 = { fg = p.cyan },
    ["@tag.attribute"]       = { fg = p.yellow },
    ["@tag.delimiter"]       = { fg = p.muted },
    ["@markup.heading"]      = { fg = p.primary, bold = true },
    ["@markup.link"]         = { fg = p.blue, underline = true },
    ["@markup.link.url"]     = { fg = p.blue, underline = true },
    ["@markup.raw"]          = { fg = p.green },
    ["@markup.list"]         = { fg = p.cyan },
    ["@markup.strong"]       = { bold = true },
    ["@markup.italic"]       = { italic = true },
    ["@markup.strikethrough"]= { strikethrough = true },
    ["@diff.plus"]           = { fg = p.success },
    ["@diff.minus"]          = { fg = p.error },
    ["@diff.delta"]          = { fg = p.yellow },

    -------------------------------------------------- LSP semantic token links
    ["@lsp.type.namespace"]  = { link = "@module" },
    ["@lsp.type.type"]       = { link = "@type" },
    ["@lsp.type.class"]      = { link = "@type" },
    ["@lsp.type.enum"]       = { link = "@type" },
    ["@lsp.type.interface"]  = { link = "@type" },
    ["@lsp.type.struct"]     = { link = "@type" },
    ["@lsp.type.parameter"]  = { link = "@variable.parameter" },
    ["@lsp.type.variable"]   = { link = "@variable" },
    ["@lsp.type.property"]   = { link = "@property" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"]   = { link = "@function" },
    ["@lsp.type.method"]     = { link = "@function.method" },
    ["@lsp.type.macro"]      = { link = "@function.macro" },
    ["@lsp.type.keyword"]    = { link = "@keyword" },
    ["@lsp.type.comment"]    = { link = "@comment" },
    ["@lsp.type.string"]     = { link = "@string" },
    ["@lsp.type.number"]     = { link = "@number" },
    ["@lsp.type.decorator"]  = { link = "@attribute" },
    ["@lsp.mod.deprecated"]  = { strikethrough = true },

    --------------------------------------------------------------- diff / git
    DiffAdd      = { bg = p.diffAdd },
    DiffChange   = { bg = p.diffChange },
    DiffDelete   = { fg = p.error, bg = p.diffDelete },
    DiffText     = { bg = p.diffText },
    GitSignsAdd    = { fg = p.secondary },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.error },
    GitSignsCurrentLineBlame = { fg = p.comment, italic = true },

    ------------------------------------------------------------------ telescope
    TelescopeNormal        = { fg = p.fg, bg = p.surface },
    TelescopeBorder        = { fg = p.border, bg = p.surface },
    TelescopePromptNormal  = { fg = p.fg, bg = p.surfaceLight },
    TelescopePromptBorder  = { fg = p.surfaceLight, bg = p.surfaceLight },
    TelescopePromptTitle   = { fg = p.bg, bg = p.primary },
    TelescopePromptPrefix  = { fg = p.pink },
    TelescopePreviewTitle  = { fg = p.bg, bg = p.green },
    TelescopeResultsTitle  = { fg = p.bg, bg = p.blue },
    TelescopeSelection     = { fg = p.fg, bg = p.selectionFocused },
    TelescopeSelectionCaret= { fg = p.pink, bg = p.selectionFocused },
    TelescopeMatching      = { fg = p.yellow, bold = true },

    ------------------------------------------------------------------- nvim-cmp
    CmpItemAbbr           = { fg = p.muted },
    CmpItemAbbrDeprecated = { fg = p.overlayLight, strikethrough = true },
    CmpItemAbbrMatch      = { fg = p.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.blue, bold = true },
    CmpItemMenu           = { fg = p.comment, italic = true },
    CmpItemKind           = { fg = p.cyan },
    CmpItemKindVariable   = { fg = p.pink },
    CmpItemKindKeyword    = { fg = p.primary },
    CmpItemKindFunction   = { fg = p.blue },
    CmpItemKindMethod     = { fg = p.blue },
    CmpItemKindConstructor= { fg = p.yellow },
    CmpItemKindClass      = { fg = p.yellow },
    CmpItemKindStruct     = { fg = p.yellow },
    CmpItemKindInterface  = { fg = p.yellow },
    CmpItemKindEnum       = { fg = p.yellow },
    CmpItemKindText       = { fg = p.green },
    CmpItemKindSnippet    = { fg = p.secondary },

    -------------------------------------------------------- indent-blankline v3
    IblIndent   = { fg = p.indent },
    IblScope    = { fg = p.selectedIndent },
    IblWhitespace = { fg = p.indent },

    --------------------------------------------------------- rainbow-delimiters
    RainbowDelimiterRed    = { fg = p.error },
    RainbowDelimiterYellow = { fg = p.yellow },
    RainbowDelimiterBlue   = { fg = p.blue },
    RainbowDelimiterOrange = { fg = p.warning },
    RainbowDelimiterGreen  = { fg = p.green },
    RainbowDelimiterViolet = { fg = p.primary },
    RainbowDelimiterCyan   = { fg = p.cyan },

    ------------------------------------------------------------------------ hop
    HopNextKey  = { fg = p.pink, bold = true },
    HopNextKey1 = { fg = p.blue, bold = true },
    HopNextKey2 = { fg = p.cyan },
    HopUnmatched= { fg = p.comment },

    ------------------------------------------------------------------------ oil
    OilDir    = { fg = p.blue },
    OilFile   = { fg = p.fg },
    OilLink   = { fg = p.cyan },
    OilCreate = { fg = p.secondary },
    OilCopy   = { fg = p.green },
    OilMove   = { fg = p.yellow },
    OilDelete = { fg = p.error },

    -------------------------------------------------------------------- which-key
    WhichKey          = { fg = p.cyan },
    WhichKeyGroup     = { fg = p.blue },
    WhichKeyDesc      = { fg = p.fg },
    WhichKeySeparator = { fg = p.comment },
    WhichKeyFloat     = { bg = p.surface },
    WhichKeyBorder    = { fg = p.overlayLight, bg = p.surface },

    -------------------------------------------------------- trouble / ts-context
    TroubleNormal = { fg = p.fg, bg = p.surface },
    TroubleText   = { fg = p.muted },
    TroubleCount  = { fg = p.primary, bg = p.selection },
    TreesitterContext           = { bg = p.surface },
    TreesitterContextLineNumber = { fg = p.lineNumber, bg = p.surface },
  }

  for group, opts in pairs(groups) do
    hl(0, group, opts)
  end

  -- terminal palette (16 ANSI)
  vim.g.terminal_color_0  = p.surfaceLight -- #2A2626
  vim.g.terminal_color_1  = p.error
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.yellow
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.primary
  vim.g.terminal_color_6  = p.cyan
  vim.g.terminal_color_7  = p.fg
  vim.g.terminal_color_8  = p.lineNumber -- #6B7D8C (true mid-gray for dim text)
  vim.g.terminal_color_9  = p.error
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.primary
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.fg
end

return M
