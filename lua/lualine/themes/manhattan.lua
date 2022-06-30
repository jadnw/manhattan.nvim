local config = require("manhattan.config")
local palette = require("manhattan.palette")

local spec = palette.load_spec(config.variant)

local function gen_mode(color)
  return {
    a = { bg = color, fg = spec.bg0, gui = "bold" },
    b = { bg = spec.pal.black.base, fg = spec.pal.accent.base },
    c = { bg = spec.pal.black.base, fg = spec.fg3 },
  }
end

local manhattan = {
  normal = gen_mode(spec.pal.accent.base),
  insert = gen_mode(spec.pal.yellow.base),
  command = gen_mode(spec.pal.purple.base),
  visual = gen_mode(spec.pal.magenta.base),
  replace = gen_mode(spec.pal.red.base),
  inactive = gen_mode(spec.fg3),
}

return manhattan
