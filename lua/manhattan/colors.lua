local Color = require("manhattan.lib.color")

local M = {}

local C = Color:new({
  bg = "#1f242a",
  fg = "#ccd3da",
  factor = 0.25,
})

M.pals = {
  soft = {
    accent = C:shade("#56c6b2"),
    black = C:shade("#181b1f"),
    red = C:shade("#f46d7e"),
    green = C:shade("#93c68c"),
    blue = C:shade("#60aafb"),
    yellow = C:shade("#e8ce9b"),
    orange = C:shade("#f4a582"),
    cyan = C:shade("#7ac6db"),
    teal = C:shade("#56c6b2"),
    magenta = C:shade("#e397bb"),
    purple = C:shade("#b196f0"),
    white = C:shade("#e6e9ec"),
    comment = "#65768a",
    bg0 = "#1f242b",
    bg1 = "#262c34",
    bg2 = "#333c47",
    bg3 = "#424d5a",
    bg4 = "#505d6d",
    fg0 = "#e6e9ec",
    fg1 = "#ced4db",
    fg2 = "#b6bfca",
    fg3 = "#aab6c1",
    sel0 = "#5f6d80",
    sel1 = "#818fa1",
  },
  medium = {
    accent = C:shade("#56c6b2"),
    black = C:shade("#101215"),
    red = C:shade("#f46d7e"),
    green = C:shade("#93c68c"),
    blue = C:shade("#60aafb"),
    yellow = C:shade("#e8ce9b"),
    orange = C:shade("#f4a582"),
    cyan = C:shade("#7ac6db"),
    teal = C:shade("#56c6b2"),
    magenta = C:shade("#e397bb"),
    purple = C:shade("#b196f0"),
    white = C:shade("#e5e9ec"),
    comment = "#617184",
    bg0 = "#181c21",
    bg1 = "#1f242a",
    bg2 = "#2d353e",
    bg3 = "#3c4652",
    bg4 = "#4b5766",
    fg0 = "#e5e9ec",
    fg1 = "#ccd3da",
    fg2 = "#b3bdc8",
    fg3 = "#a7b3bf",
    sel0 = "#5a687a",
    sel1 = "#7c8b9e",
  },
  hard = {
    accent = C:shade("#56c6b2"),
    black = C:shade("#0e1013"),
    red = C:shade("#f46d7e"),
    green = C:shade("#93c68c"),
    blue = C:shade("#60aafb"),
    yellow = C:shade("#e8ce9b"),
    orange = C:shade("#f4a582"),
    cyan = C:shade("#7ac6db"),
    teal = C:shade("#56c6b2"),
    magenta = C:shade("#e397bb"),
    purple = C:shade("#b196f0"),
    white = C:shade("#cfd6dc"),
    comment = "#596779",
    bg0 = "#16191e",
    bg1 = "#1c2126",
    bg2 = "#293039",
    bg3 = "#37404b",
    bg4 = "#45505d",
    fg0 = "#cfd6dc",
    fg1 = "#b8c2cb",
    fg2 = "#a1adbb",
    fg3 = "#96a4b2",
    sel0 = "#525f70",
    sel1 = "#6f7f94",
  },
}

--- Generate spec
-- @param accent string
-- @param pal table
function M.gen_spec(variant, pals)
  local pal = pals[variant]

  local spec = {
    bg0 = pal.bg0, -- Dark bg (status line and float)
    bg1 = pal.bg1, -- Default bg
    bg2 = pal.bg2, -- Lighter bg (colorcolm folds)
    bg3 = pal.bg3, -- Lighter bg (cursor line)
    bg4 = pal.bg4, -- Conceal, border fg

    fg0 = pal.fg0, -- Lighter fg
    fg1 = pal.fg1, -- Default fg
    fg2 = pal.fg2, -- Darker fg (status line)
    fg3 = pal.fg3, -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  spec.pal = {
    accent = pal.accent,
    black = pal.black,
    red = pal.red,
    green = pal.green,
    blue = pal.blue,
    yellow = pal.yellow,
    orange = pal.orange,
    cyan = pal.cyan,
    teal = pal.teal,
    magenta = pal.magenta,
    purple = pal.purple,
    white = pal.white,
  }

  spec.syntax = {
    attr = pal.yellow.base, -- HTML tag attribues
    bool = pal.orange.base, -- Boolean
    bracket = spec.fg2, -- Brackets and Punctuation
    builtin0 = pal.magenta.base, -- Builtin variable
    builtin1 = pal.yellow.base, -- Builtin type
    builtin2 = pal.orange.base, -- Builtin const
    builtin3 = pal.red.bright, -- Not used
    comment = pal.comment, -- Comment
    conditional = pal.magenta.base, -- Conditional and loop
    const = pal.orange.bright, -- Constants, imports and booleans
    constructor = pal.orange.base, -- Constructor, JSX elements
    dep = spec.fg3, -- Deprecated
    field = pal.teal.base, -- Field, Property
    func = pal.blue.base, -- Functions and Titles
    ident = pal.magenta.bright, -- Identifiers
    keyword = pal.purple.base, -- Keywords
    number = pal.orange.bright, -- Numbers
    operator = pal.purple.bright, -- Operators
    param = pal.red.bright, -- Params
    preproc = pal.magenta.base, -- PreProc
    regex = pal.orange.base, -- Regex
    statement = pal.purple.base, -- Statements
    string = pal.green.base, -- Strings
    tag_delimiter = pal.teal.base, -- Tag delimiter
    type = pal.yellow.base, -- Types
    variable = spec.fg1, -- Variables
  }

  spec.diag = {
    error = pal.red.base,
    warn = pal.yellow.base,
    info = pal.blue.base,
    hint = pal.green.base,
  }

  spec.diff = {
    add = pal.green.dim,
    delete = pal.red.dim,
    change = pal.yellow.dim,
    text = pal.cyan.dim,
  }

  spec.git = {
    add = pal.cyan.base,
    removed = pal.red.base,
    changed = pal.yellow.base,
    conflict = pal.orange.base,
    ignored = pal.comment,
  }

  return spec
end

return M
