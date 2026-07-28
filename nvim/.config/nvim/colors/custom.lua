-- Minimal colorscheme for reading code. Everything you named, and the
-- punctuation around it, stays plain foreground.
--
--   dim      you can skip this        comments
--   blue     what the code does       keywords, preprocessor
--   cyan     what the code is         types
--   green    this is data, not code   strings and chars
--   magenta  this is a literal value  numbers, booleans, null
--
-- red/yellow/orange are state only: diagnostics, diffs, search.

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
end

local nvim_set_hl = vim.api.nvim_set_hl

local bg = "#2e3440"      -- canvas
local surface = "#3b4252" -- raised: statusline, popups, cursorline
local dim = "#616e88"     -- skippable: comments, line numbers, chrome
local fg = "#d8dee9"      -- everything else

local blue = "#81a1c1"
local cyan = "#88c0d0"
local green = "#a3be8c"
local magenta = "#b48ead"

local red = "#bf616a"
local yellow = "#ebcb8b"
local orange = "#d08770"

vim.g.terminal_color_0 = surface
vim.g.terminal_color_1 = red
vim.g.terminal_color_2 = green
vim.g.terminal_color_3 = yellow
vim.g.terminal_color_4 = blue
vim.g.terminal_color_5 = magenta
vim.g.terminal_color_6 = cyan
vim.g.terminal_color_7 = fg
vim.g.terminal_color_8 = dim
vim.g.terminal_color_9 = red
vim.g.terminal_color_10 = green
vim.g.terminal_color_11 = yellow
vim.g.terminal_color_12 = blue
vim.g.terminal_color_13 = magenta
vim.g.terminal_color_14 = cyan
vim.g.terminal_color_15 = fg

local highlights = {
    -- Editor chrome
    Normal = { fg = fg, bg = bg },
    NormalFloat = { fg = fg, bg = surface },
    FloatBorder = { fg = dim, bg = surface },
    FloatTitle = { fg = fg, bg = surface, bold = true },

    Bold = { bold = true },
    Italic = { italic = true },
    Underlined = { underline = true },
    Conceal = {},

    ColorColumn = { bg = surface },
    CursorLine = { bg = surface },
    CursorColumn = { bg = surface },
    CursorLineNr = { fg = fg },
    LineNr = { fg = dim },
    SignColumn = { bg = bg },
    FoldColumn = { fg = dim, bg = bg },
    Folded = { fg = dim, bg = surface },
    EndOfBuffer = { fg = bg },
    NonText = { fg = dim },
    SpecialKey = { fg = dim },
    Whitespace = { fg = surface },
    WinSeparator = { fg = surface },
    Directory = { fg = blue },
    Title = { fg = fg, bold = true },
    Cursor = { fg = bg, bg = fg },

    -- fg pinned: a bg-only group inherits fg from whatever else hits the cell.
    MatchParen = { fg = fg, bg = dim },

    -- Solid block, so it stays visible on top of CursorLine.
    Visual = { fg = bg, bg = dim },
    VisualNOS = { fg = bg, bg = dim },

    Search = { fg = bg, bg = yellow },
    IncSearch = { fg = bg, bg = orange },
    CurSearch = { fg = bg, bg = orange },
    Substitute = { fg = bg, bg = orange },

    Pmenu = { fg = fg, bg = surface },
    PmenuSel = { fg = fg, bg = dim },
    PmenuSbar = { bg = surface },
    PmenuThumb = { bg = dim },
    WildMenu = { fg = fg, bg = dim },

    StatusLine = { fg = fg, bg = surface },
    StatusLineNC = { fg = dim, bg = bg },
    WinBar = { fg = dim, bg = bg },
    WinBarNC = { fg = dim, bg = bg },
    TabLine = { fg = dim, bg = bg },
    TabLineFill = { bg = bg },
    TabLineSel = { fg = fg, bg = surface, bold = true },

    ModeMsg = { fg = fg },
    MoreMsg = { fg = fg },
    Question = { fg = fg },
    ErrorMsg = { fg = red },
    WarningMsg = { fg = yellow },
    QuickFixLine = { bg = surface },

    -- Syntax
    Comment = { fg = dim },

    Identifier = { fg = fg },
    Function = { fg = fg },
    Constant = { fg = fg },
    Operator = { fg = fg },
    Delimiter = { fg = fg },
    Special = { fg = fg },
    SpecialChar = { fg = fg },
    Tag = { fg = fg },
    Debug = { fg = fg },
    Ignore = { fg = dim },

    Statement = { fg = blue },
    Keyword = { fg = blue },
    Conditional = { fg = blue },
    Repeat = { fg = blue },
    Label = { fg = blue },
    Exception = { fg = blue },
    StorageClass = { fg = blue },

    Type = { fg = cyan },
    Structure = { fg = cyan },
    Typedef = { fg = cyan },

    PreProc = { fg = blue },
    Include = { fg = blue },
    Define = { fg = blue },
    Macro = { fg = blue },
    PreCondit = { fg = blue },

    String = { fg = green },
    Character = { fg = green },
    Number = { fg = magenta },
    Float = { fg = magenta },
    Boolean = { fg = magenta },

    Todo = { fg = yellow, bold = true },
    Error = { fg = red },
    SpecialComment = { fg = dim, bold = true },

    -- Tree-sitter. Fallback walks the dot-prefix (@tag.delimiter -> @tag), and
    -- nvim's defaults often point elsewhere. Omitted captures land on fg.
    ["@variable"] = { fg = fg },                 -- default is a literal color
    ["@variable.builtin"] = { fg = blue },
    ["@constant.builtin"] = { fg = magenta },
    ["@constant.macro"] = { fg = blue },
    ["@type.builtin"] = { fg = cyan },
    ["@module"] = { fg = fg },
    ["@attribute"] = { fg = fg },

    -- Part of the language, not imported. Empty in C++, where these are keywords.
    ["@function.builtin"] = { fg = blue },

    ["@string.escape"] = { fg = magenta },       -- the \n inside a string
    ["@string.regexp"] = { fg = green },
    ["@character.special"] = { fg = magenta },

    ["@comment.error"] = { fg = red, bold = true },
    ["@comment.warning"] = { fg = yellow, bold = true },
    ["@comment.todo"] = { fg = yellow, bold = true },
    ["@comment.note"] = { fg = blue, bold = true },

    ["@tag"] = { fg = blue },
    ["@tag.builtin"] = { fg = blue },
    ["@tag.attribute"] = { fg = fg },
    ["@tag.delimiter"] = { fg = fg },            -- else inherits @tag above

    ["@markup.heading"] = { fg = blue, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.link"] = { fg = blue, underline = true },
    ["@markup.link.url"] = { fg = dim, underline = true },
    ["@markup.raw"] = { fg = green },
    ["@markup.quote"] = { fg = dim, italic = true },

    -- Diagnostics
    DiagnosticOk = { fg = green },
    DiagnosticError = { fg = red },
    DiagnosticWarn = { fg = yellow },
    DiagnosticInfo = { fg = blue },
    DiagnosticHint = { fg = dim },
    DiagnosticUnderlineOk = { sp = green, undercurl = true },
    DiagnosticUnderlineError = { sp = red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = blue, undercurl = true },
    DiagnosticUnderlineHint = { sp = dim, undercurl = true },
    DiagnosticDeprecated = { sp = dim, strikethrough = true },
    DiagnosticUnnecessary = { fg = dim },

    SpellBad = { sp = red, undercurl = true },
    SpellCap = { sp = yellow, undercurl = true },
    SpellLocal = { sp = yellow, undercurl = true },
    SpellRare = { sp = yellow, undercurl = true },

    -- LSP. `dim` not `surface`: these land on the cursorline, which is surface.
    LspReferenceText = { bg = dim },
    LspReferenceRead = { bg = dim },
    LspReferenceWrite = { bg = dim },
    LspSignatureActiveParameter = { fg = fg, bg = dim },
    LspCodeLens = { fg = dim },
    LspCodeLensSeparator = { fg = dim },
    LspInlayHint = { fg = dim },

    -- Default-links to Visual, i.e. a solid block per placeholder.
    SnippetTabstop = { bg = surface },
    SnippetTabstopActive = { bg = dim },

    -- Diffs
    DiffAdd = { fg = green },
    DiffChange = { fg = yellow },
    DiffDelete = { fg = red },
    DiffText = { fg = yellow, bold = true },
    Added = { fg = green },
    Changed = { fg = yellow },
    Removed = { fg = red },

    gitcommitDiscardedFile = { fg = red },
    gitcommitUntrackedFile = { fg = red },
    gitcommitSelectedFile = { fg = green },

    -- Plugins
    MiniIndentscopeSymbol = { fg = surface },
    TreesitterContext = { bg = surface },

    -- Only takes effect if your dap config sign_defines with these names.
    DapStoppedLine = { underline = true, sp = yellow },
    debugPC = { underline = true, sp = yellow },
    DapStopped = { fg = bg, bg = yellow },
    DapBreakpoint = { fg = red },
}

for group, opts in pairs(highlights) do
    nvim_set_hl(0, group, opts)
end

-- Semantic tokens outrank tree-sitter (125 vs 100); clearing them makes
-- clangd fall through instead of repainting everything above.
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    nvim_set_hl(0, group, {})
end

vim.g.colors_name = "nord"
