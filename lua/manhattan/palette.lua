local M = {}

M.variants = {
  soft = "soft",
  default = "default",
  hard = "hard",
}

function M.load_spec(variant)
  variant = vim.tbl_contains(vim.tbl_keys(M.variants), variant) and variant or "default"
  local colors = require("manhattan.colors")
  return colors.gen_spec(M.variants[variant], colors.pals)
end

return M
