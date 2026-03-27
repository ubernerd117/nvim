# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim as the plugin manager. All configuration is written in Lua.

## Architecture

- `init.lua` — Entry point. Loads config modules and sets the colorscheme (`tron`).
- `lua/config/` — Core configuration:
  - `maps.lua` — Keymaps (leader is Space). Includes a custom terminal split function on `t`.
  - `settings.lua` — Editor options (2-space indentation, relative line numbers, etc.).
  - `lazy.lua` — Bootstraps lazy.nvim and loads plugins from `lua/plugins/`.
- `lua/plugins/` — Each file returns a lazy.nvim plugin spec. Plugins are auto-discovered by lazy.nvim via `require('lazy').setup('plugins')`.
- `colors/tron.lua` — Custom colorscheme with a Tron Legacy aesthetic (black background, cyan/blue/orange palette).

## Plugin Stack

- **LSP**: mason.nvim + mason-lspconfig + nvim-lspconfig. Servers: `lua_ls`, `biome`, `pyright`, `gopls`.
- **Telescope**: Fuzzy finder with ui-select extension.
- **Treesitter**: Syntax highlighting and incremental selection.
- **Harpoon** (v2): Quick file navigation.
- **Undotree**: Undo history visualization.
- **Colorschemes**: nightfox.nvim installed, but active theme is custom `tron`.

## Conventions

- Plugin keymaps are defined inside each plugin's `config` function, not in `maps.lua`.
- Global keymaps (non-plugin) go in `lua/config/maps.lua`.
- No completion engine is installed — LSP provides hover, go-to-definition, and code actions only.
