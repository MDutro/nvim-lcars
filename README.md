# nvim-lcars

A Neovim colorscheme inspired by the LCARS interface from Star Trek: The Next Generation. Dark background, warm ochre and steel-blue palette, full Treesitter and LSP diagnostic support.

## Variants

| Name | Description |
|------|-------------|
| `tng` | TNG-era LCARS — warm ochre, amber, and cool blue-grey |
| `ds9` | DS9-era LCARS — cool purple, teal, and blue-violet |
| `udc` | Film-era LCARS (ST V/VI) — electric teal-green, lime, and cyan on dark phosphor-green |

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

```lua
vim.cmd("colorscheme lcars-tng")
```

Or via setup (for future configuration options):

```lua
require("lcars").setup({
  variant = "tng",
})
```

## License

MIT — see [LICENSE](LICENSE)
