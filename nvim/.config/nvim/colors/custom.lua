-- slate: comments
-- gold: keywords, preprocessor
-- teal: types
-- blue: strings
-- pink: literals
-- red/yellow/sage state: diagnostics, diffs, search

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
end

local nvim_set_hl = vim.api.nvim_set_hl

local black = "#161618"
local charcoal = "#1d1d1c"
local gray = "#534c50"
local light_gray = "#afb8b8"

local slate = "#616e88"

local gold = "#da9d38"
local teal = "#678E87"
local pink = "#c7a2aa"
local blue = "#8ca4c8"

local red = "#bf616a"
local yellow = "#ebcb8b"
local sage = "#ACAF9C"

local highlights = {
    -- Chrome
    Normal = { fg = light_gray, bg = black },
    NormalFloat = { fg = light_gray, bg = charcoal },
    FloatBorder = { fg = gray, bg = charcoal },
    FloatTitle = { fg = light_gray, bg = charcoal, bold = true },

    Bold = { bold = true },
    Italic = { italic = true },
    Underlined = { underline = true },
    Conceal = {},

    ColorColumn = { bg = charcoal },
    CursorLine = { bg = charcoal },
    CursorColumn = { bg = charcoal },
    CursorLineNr = { fg = light_gray },
    LineNr = { fg = gray },
    SignColumn = { bg = black },
    FoldColumn = { fg = gray, bg = black },
    Folded = { fg = gray, bg = charcoal },
    EndOfBuffer = { fg = black },
    NonText = { fg = gray },
    SpecialKey = { fg = gray },
    Whitespace = { fg = charcoal },
    WinSeparator = { fg = charcoal },
    Directory = { fg = gold },
    Title = { fg = light_gray, bold = true },
    Cursor = { fg = black, bg = light_gray },

    MatchParen = { fg = light_gray, bg = gray },

    -- Selection and search
    Visual = { fg = black, bg = gray },
    VisualNOS = { fg = black, bg = gray },
    Search = { fg = black, bg = yellow },
    IncSearch = { fg = black, bg = sage },
    CurSearch = { fg = black, bg = sage },
    Substitute = { fg = black, bg = sage },

    Pmenu = { fg = light_gray, bg = charcoal },
    PmenuSel = { fg = light_gray, bg = gray },
    PmenuSbar = { bg = charcoal },
    PmenuThumb = { bg = gray },
    WildMenu = { fg = light_gray, bg = gray },

    StatusLine = { fg = light_gray, bg = charcoal },
    StatusLineNC = { fg = gray, bg = black },
    WinBar = { fg = gray, bg = black },
    WinBarNC = { fg = gray, bg = black },
    TabLine = { fg = gray, bg = black },
    TabLineFill = { bg = black },
    TabLineSel = { fg = light_gray, bg = charcoal, bold = true },

    ModeMsg = { fg = light_gray },
    MoreMsg = { fg = light_gray },
    Question = { fg = light_gray },
    ErrorMsg = { fg = red },
    WarningMsg = { fg = yellow },
    QuickFixLine = { bg = charcoal },

    -- Syntax
    Comment = { fg = slate },

    Identifier = { fg = light_gray },
    Function = { fg = light_gray },
    Constant = { fg = light_gray },
    Operator = { fg = gold },
    Delimiter = { fg = light_gray },
    Special = { fg = light_gray },
    SpecialChar = { fg = light_gray },
    Tag = { fg = light_gray },
    Debug = { fg = light_gray },
    Ignore = { fg = gray },

    Statement = { fg = gold },
    Keyword = { fg = gold },
    Conditional = { fg = gold },
    Repeat = { fg = gold },
    Label = { fg = gold },
    Exception = { fg = gold },
    StorageClass = { fg = gold },

    Type = { fg = teal },
    Structure = { fg = teal },
    Typedef = { fg = teal },

    PreProc = { fg = gold },
    Include = { fg = gold },
    Define = { fg = gold },
    Macro = { fg = gold },
    PreCondit = { fg = gold },

    String = { fg = blue },
    Character = { fg = blue },
    Number = { fg = pink },
    Float = { fg = pink },
    Boolean = { fg = pink },

    Todo = { fg = yellow, bold = true },
    Error = { fg = red },
    SpecialComment = { fg = slate, bold = true },

    -- Tree-sitter
    ["@variable"] = { fg = light_gray },
    ["@variable.builtin"] = { fg = gold },
    ["@constant.builtin"] = { fg = pink },
    ["@constant.macro"] = { fg = gold },
    ["@type.builtin"] = { fg = teal },
    ["@module"] = { fg = light_gray },
    ["@attribute"] = { fg = light_gray },

    ["@function.builtin"] = { fg = gold },

    ["@string.escape"] = { fg = pink },
    ["@string.regexp"] = { fg = blue },
    ["@character.special"] = { fg = pink },

    ["@comment.error"] = { fg = red, bold = true },
    ["@comment.warning"] = { fg = yellow, bold = true },
    ["@comment.todo"] = { fg = yellow, bold = true },
    ["@comment.note"] = { fg = gold, bold = true },

    ["@tag"] = { fg = gold },
    ["@tag.builtin"] = { fg = gold },
    ["@tag.attribute"] = { fg = light_gray },
    ["@tag.delimiter"] = { fg = light_gray }, -- else inherits @tag

    ["@markup.heading"] = { fg = gold, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.link"] = { fg = gold, underline = true },
    ["@markup.link.url"] = { fg = gray, underline = true },
    ["@markup.raw"] = { fg = blue },
    ["@markup.quote"] = { fg = gray, italic = true },

    -- Diagnostics
    DiagnosticOk = { fg = blue },
    DiagnosticError = { fg = red },
    DiagnosticWarn = { fg = yellow },
    DiagnosticInfo = { fg = gold },
    DiagnosticHint = { fg = gray },
    DiagnosticUnderlineOk = { sp = blue, undercurl = true },
    DiagnosticUnderlineError = { sp = red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = gold, undercurl = true },
    DiagnosticUnderlineHint = { sp = gray, undercurl = true },
    DiagnosticDeprecated = { sp = gray, strikethrough = true },
    DiagnosticUnnecessary = { fg = gray },

    SpellBad = { sp = red, undercurl = true },
    SpellCap = { sp = yellow, undercurl = true },
    SpellLocal = { sp = yellow, undercurl = true },
    SpellRare = { sp = yellow, undercurl = true },

    -- LSP. gray not charcoal: these land on the cursorline.
    LspReferenceText = { bg = gray },
    LspReferenceRead = { bg = gray },
    LspReferenceWrite = { bg = gray },
    LspSignatureActiveParameter = { fg = light_gray, bg = gray },
    LspCodeLens = { fg = gray },
    LspCodeLensSeparator = { fg = gray },
    LspInlayHint = { fg = gray },

    SnippetTabstop = { bg = charcoal },
    SnippetTabstopActive = { bg = gray },

    -- Diffs
    DiffAdd = { fg = blue },
    DiffChange = { fg = yellow },
    DiffDelete = { fg = red },
    DiffText = { fg = yellow, bold = true },
    Added = { fg = blue },
    Changed = { fg = yellow },
    Removed = { fg = red },

    gitcommitDiscardedFile = { fg = red },
    gitcommitUntrackedFile = { fg = red },
    gitcommitSelectedFile = { fg = blue },

    -- Plugins
    TreesitterContext = { bg = charcoal },
    GitSignsAdd = { fg = teal },
    GitSignsChange = { fg = yellow },
    GitSignsDelete = { fg = red },
    GitSignsTopdelete = { fg = red },
    GitSignsChangedelete = { fg = yellow },
    GitSignsUntracked = { fg = gray },
    GitSignsAddPreview = { fg = teal },
    GitSignsDeletePreview = { fg = red },
    GitSignsAddInline = { fg = black, bg = blue },
    GitSignsDeleteInline = { fg = black, bg = red },
    GitSignsChangeInline = { fg = black, bg = yellow },
}

for group, opts in pairs(highlights) do
    nvim_set_hl(0, group, opts)
end

-- Clear LSP semantic tokens so tree-sitter wins.
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    nvim_set_hl(0, group, {})
end

vim.g.colors_name = "custom"
