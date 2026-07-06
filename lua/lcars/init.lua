local M = {}

local palettes = {
  tng = "lcars.palettes.tng",
  ds9 = "lcars.palettes.ds9",
  udc = "lcars.palettes.udc",
}

local state_file = vim.fn.stdpath("data") .. "/lcars_variant"

local function save_variant(variant)
  vim.fn.writefile({ variant }, state_file)
end

local function saved_variant()
  local ok, lines = pcall(vim.fn.readfile, state_file)
  if ok and lines and lines[1] and palettes[lines[1]] then
    return lines[1]
  end
end

function M.load(variant)
  variant = variant or "tng"

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
  save_variant(variant)
end

function M.setup(opts)
  opts = opts or {}
  M.load(opts.variant or saved_variant() or "tng")
end

return M
