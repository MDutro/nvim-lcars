# nvim-lcars

A Neovim colorscheme collection inspired by the computer interfaces of Star Trek. Three screen-accurate variants, each built from reference images of the original props. All syntax colors meet WCAG AA contrast requirements.

## Variants

| Name | Description |
|------|-------------|
| `tng` | TNG-era LCARS — screen-accurate golden yellow and muted periwinkle on warm dark background |
| `ds9` | Cardassian — screen-accurate teal-cyan and dusty rose on near-black |
| `udc` | Film-era (ST V/VI) — lime-green and electric cyan on dark blue-black |

## Requirements

- Neovim 0.8+
- A terminal with true color support (`termguicolors`)

## Installation

### lazy.nvim

```lua
{
  "MDutro/nvim-lcars",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme lcars-tng")
  end,
}
```

Replace `lcars-tng` with `lcars-ds9` or `lcars-udc` for other variants.

### packer.nvim

```lua
use {
  "MDutro/nvim-lcars",
  config = function()
    vim.cmd("colorscheme lcars-tng")
  end,
}
```

## Usage

Activate directly:

```vim
:colorscheme lcars-tng
```

Or via setup:

```lua
require("lcars").setup({
  variant = "tng", -- "tng" | "ds9" | "udc"
})
```

## Plugin support

Highlight groups are defined for:

- Treesitter (`@` capture groups)
- LSP diagnostics and semantic tokens
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim) indent scope
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

## License

MIT — see [LICENSE](LICENSE)
