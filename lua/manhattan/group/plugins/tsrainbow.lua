-- https://github.com/p00f/nvim-ts-rainbow

local M = {}

function M.get(spec, config, opts)
  return {
    rainbowcol1 = { fg = spec.pal.teal.base },
    rainbowcol2 = { fg = spec.pal.blue.base },
    rainbowcol3 = { fg = spec.pal.green.base },
    rainbowcol4 = { fg = spec.pal.purple.base },
    rainbowcol5 = { fg = spec.pal.cyan.base },
    rainbowcol6 = { fg = spec.pal.orange.base },
    rainbowcol7 = { fg = spec.pal.red.base },
  }
end

return M
