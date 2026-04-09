# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim as the plugin manager. All configuration is written in Lua.

## Architecture

- `init.lua` — Entry point. Loads config modules and sets the colorscheme (`tron`).
- `lua/config/` — Core configuration:
  - `maps.lua` — Keymaps (leader is Space). Window navigation (`Ctrl-h/j/k/l`) in normal and terminal modes.
  - `settings.lua` — Editor options (2-space indentation, relative line numbers, etc.).
  - `lazy.lua` — Bootstraps lazy.nvim and loads plugins from `lua/plugins/`.
- `lua/plugins/` — Each file returns a lazy.nvim plugin spec. Plugins are auto-discovered by lazy.nvim via `require('lazy').setup('plugins')`.
- `colors/tron.lua` — Custom colorscheme with a Tron Legacy aesthetic (black background, cyan/blue/orange palette).

## Plugin Stack

- **LSP**: mason.nvim + mason-lspconfig + nvim-lspconfig. Servers: `lua_ls`, `ts_ls`, `biome`, `pyright`, `gopls`, `rust_analyzer`.
- **Telescope**: Fuzzy finder with ui-select extension.
- **Treesitter**: Syntax highlighting and incremental selection.
- **Harpoon** (v2): Quick file navigation.
- **Undotree**: Undo history visualization.
- **Snacks.nvim**: Terminal toggle (`<leader>t`), floating terminal (`<leader>ft`), lazygit (`<leader>lg`), and in-editor notifications.
- **Autocompletion**: blink.cmp with LSP, path, and buffer sources.
- **Formatting**: conform.nvim with format-on-save. Biome for JS/TS/JSON/CSS, stylua for Lua, LSP fallback for everything else.
- **Git signs**: gitsigns.nvim shows added/modified/deleted lines in the gutter.
- **Which-key**: Keymap discovery popup on leader press.
- **Colorschemes**: nightfox.nvim installed, but active theme is custom `tron`.

## Conventions

- Plugin keymaps are defined inside each plugin's `config` function, not in `maps.lua`.
- Global keymaps (non-plugin) go in `lua/config/maps.lua`.
- Autocompletion is handled by blink.cmp. LSP also provides hover (`K`), go-to-definition (`gd`), and code actions (`<leader>ca`).
