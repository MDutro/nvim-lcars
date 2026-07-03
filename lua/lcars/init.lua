local M = {}

local palettes = {
  tng = "lcars.palettes.tng",
  ds9 = "lcars.palettes.ds9",
  udc = "lcars.palettes.udc",
}

function M.load(variant, opts)
  variant = variant or "tng"
  opts = opts or {}

  local palette_mod = palettes[variant]
  if not palette_mod then
    vim.notify("lcars: unknown variant '" .. variant .. "'", vim.log.levels.ERROR)
    return
  end

  local ok, palette = pcall(require, palette_mod)
  if not ok then
    vim.notify("lcars: failed to load palette '" .. variant .. "': " .. palette, vim.log.levels.ERROR)
    return
  end

  vim.opt.termguicolors = true
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "lcars-" .. variant

  require("lcars.highlights").apply(palette)
end

function M.setup(opts)
  opts = opts or {}
  M.load(opts.variant or "tng", opts)
end

return M
