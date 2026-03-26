# Tron Colorscheme Redesign

## Overview

Full overhaul of the custom Tron Legacy Neovim colorscheme. Rebuild the palette around a semantic color spectrum (cool→warm→hot) and add subtle glow treatments, while filling all missing core highlight groups.

## Design Principles

1. **Semantic spectrum**: blue/cyan = good/structure, yellow/amber = caution/data, red = danger/errors
2. **Subtle glow**: bold for lit elements, faint tinted backgrounds for depth, undercurl for diagnostics
3. **Ares red**: reserved neon red `#FF1744` for the most critical errors/deletions
4. **Core only**: style all built-in Neovim groups properly; leave plugin-specific groups (Telescope, Harpoon, Undotree) as-is from current file

## Palette

### Cool Zone (blue/cyan) — Good, primary, interactive

| Name            | Hex       | Role                              |
|-----------------|-----------|-----------------------------------|
| `cyan_bright`   | `#00FFFF` | Functions, active elements        |
| `cyan_dim`      | `#00BCD4` | Types, operators                  |
| `blue_electric` | `#2979FF` | Keywords, statements              |
| `blue_soft`     | `#4FC3F7` | Preprocessor, properties, params  |

### Warm Zone (yellow/amber) — Caution, data

| Name         | Hex       | Role                        |
|--------------|-----------|------------------------------|
| `amber`      | `#FFD600` | Strings, search highlights   |
| `amber_deep` | `#FFA000` | Warnings                     |
| `orange`     | `#FF9100` | Constants, numbers, booleans |

### Hot Zone (red) — Ares, danger

| Name         | Hex       | Role                     |
|--------------|-----------|--------------------------|
| `red_neon`   | `#FF1744` | Errors, deletions (Ares) |
| `red_orange` | `#FF3D00` | Exceptions, debug        |

### Neutrals — The void

| Name          | Hex       | Role                              |
|---------------|-----------|-----------------------------------|
| `bg`          | `#000000` | True black background             |
| `fg`          | `#E0F7FA` | Foreground, white with cyan hint  |
| `cursorline`  | `#060E14` | Faint cyan-black cursor line      |
| `panel`       | `#0A1A24` | Float/panel backgrounds           |
| `surface`     | `#1A2A34` | Elevated surfaces, separators     |
| `muted`       | `#37474F` | Line numbers, fold column         |
| `comment`     | `#546E7A` | Comments, delimiters              |
| `visual`      | `#0A2A3A` | Visual selection background       |
| `diff_add_bg` | `#002A2A` | Diff add background               |
| `diff_chg_bg` | `#2A2A00` | Diff change background            |
| `diff_del_bg` | `#2A0000` | Diff delete background            |

## Highlight Group Mapping

### Base UI

| Group          | Foreground     | Background   | Style   |
|----------------|----------------|--------------|---------|
| `Normal`       | `fg`           | `bg`         |         |
| `NormalFloat`  | `fg`           | `panel`      |         |
| `FloatBorder`  | `cyan_bright`  | `bg`         |         |
| `Cursor`       | `bg`           | `cyan_bright`|         |
| `CursorLine`   | —              | `cursorline` |         |
| `CursorColumn` | —              | `cursorline` |         |
| `Visual`       | —              | `visual`     |         |
| `LineNr`       | `muted`        |              |         |
| `CursorLineNr` | `cyan_bright`  |              | bold    |
| `SignColumn`   | —              | `bg`         |         |
| `FoldColumn`   | `muted`        |              |         |
| `Folded`       | `blue_soft`    | `panel`      |         |
| `VertSplit`    | `surface`      |              |         |
| `WinSeparator` | `surface`      |              |         |
| `StatusLine`   | `cyan_dim`     | `panel`      |         |
| `StatusLineNC` | `muted`        | `cursorline` |         |
| `TabLine`      | `muted`        | `cursorline` |         |
| `TabLineSel`   | `cyan_bright`  | `panel`      | bold    |
| `TabLineFill`  | —              | `bg`         |         |
| `NonText`      | `surface`      |              |         |
| `EndOfBuffer`  | `surface`      |              |         |
| `SpecialKey`   | `muted`        |              |         |
| `MatchParen`   | `cyan_bright`  | `#003344`    | bold    |
| `Title`        | `cyan_bright`  |              | bold    |
| `Directory`    | `blue_electric`|              |         |
| `WildMenu`     | `bg`           | `cyan_bright`|         |
| `Question`     | `cyan_bright`  |              |         |
| `MoreMsg`      | `cyan_dim`     |              |         |
| `ModeMsg`      | `cyan_dim`     |              |         |
| `WarningMsg`   | `amber_deep`   |              |         |
| `ErrorMsg`     | `red_neon`     |              | bold    |

### Syntax (Vim standard groups)

| Group          | Foreground     | Style         |
|----------------|----------------|---------------|
| `Comment`      | `comment`      | italic        |
| `Constant`     | `orange`       |               |
| `String`       | `amber`        |               |
| `Character`    | `amber`        |               |
| `Number`       | `orange`       |               |
| `Boolean`      | `orange`       |               |
| `Float`        | `orange`       |               |
| `Identifier`   | `fg`           |               |
| `Function`     | `cyan_bright`  | bold          |
| `Statement`    | `blue_electric`|               |
| `Conditional`  | `blue_electric`|               |
| `Repeat`       | `blue_electric`|               |
| `Label`        | `blue_electric`|               |
| `Operator`     | `cyan_dim`     |               |
| `Keyword`      | `blue_electric`| italic        |
| `Exception`    | `red_orange`   |               |
| `PreProc`      | `blue_soft`    |               |
| `Include`      | `blue_soft`    |               |
| `Define`       | `blue_soft`    |               |
| `Macro`        | `blue_soft`    |               |
| `PreCondit`    | `blue_soft`    |               |
| `Type`         | `cyan_dim`     |               |
| `StorageClass` | `cyan_dim`     |               |
| `Structure`    | `cyan_dim`     |               |
| `Typedef`      | `cyan_dim`     |               |
| `Special`      | `orange`       |               |
| `SpecialChar`  | `orange`       |               |
| `Tag`          | `orange`       |               |
| `Delimiter`    | `comment`      |               |
| `SpecialComment`| `comment`     |               |
| `Debug`        | `red_orange`   |               |
| `Underlined`   | —              | underline     |
| `Ignore`       | —              |               |
| `Error`        | `red_neon`     | bold          |
| `Todo`         | `bg` fg, `cyan_bright` bg | bold |

### Search

| Group      | Foreground | Background   |
|------------|------------|--------------|
| `Search`   | `bg`       | `amber`      |
| `IncSearch` | `bg`      | `amber_deep` |
| `CurSearch` | `bg`      | `amber_deep` |

### Popup Menu

| Group        | Foreground    | Background   |
|--------------|---------------|--------------|
| `Pmenu`      | `fg`          | `panel`      |
| `PmenuSel`   | `bg`          | `cyan_bright`|
| `PmenuSbar`  | —             | `panel`      |
| `PmenuThumb` | —             | `cyan_dim`   |

### Diff

| Group       | Foreground    | Background    |
|-------------|---------------|---------------|
| `DiffAdd`   | `cyan_bright` | `diff_add_bg` |
| `DiffChange`| `amber`       | `diff_chg_bg` |
| `DiffDelete`| `red_neon`    | `diff_del_bg` |
| `DiffText`  | `bg`          | `amber`       |

### Diagnostics (LSP)

| Group                      | Foreground   | Style                         |
|----------------------------|--------------|-------------------------------|
| `DiagnosticError`          | `red_neon`   |                               |
| `DiagnosticWarn`           | `amber_deep` |                               |
| `DiagnosticInfo`           | `cyan_bright`|                               |
| `DiagnosticHint`           | `blue_soft`  |                               |
| `DiagnosticUnderlineError` | —            | undercurl, sp = `red_neon`    |
| `DiagnosticUnderlineWarn`  | —            | undercurl, sp = `amber_deep`  |
| `DiagnosticUnderlineInfo`  | —            | undercurl, sp = `cyan_bright` |
| `DiagnosticUnderlineHint`  | —            | undercurl, sp = `blue_soft`   |

### Treesitter

| Group                    | Foreground     | Style   |
|--------------------------|----------------|---------|
| `@variable`              | `fg`           |         |
| `@variable.builtin`      | `cyan_dim`     |         |
| `@variable.parameter`    | `blue_soft`    |         |
| `@function`              | `cyan_bright`  | bold    |
| `@function.builtin`      | `cyan_bright`  |         |
| `@function.call`         | `cyan_bright`  |         |
| `@keyword`               | `blue_electric`| italic  |
| `@keyword.function`      | `blue_electric`| italic  |
| `@keyword.return`        | `blue_electric`| italic  |
| `@keyword.operator`      | `cyan_dim`     |         |
| `@string`                | `amber`        |         |
| `@number`                | `orange`       |         |
| `@boolean`               | `orange`       |         |
| `@type`                  | `cyan_dim`     |         |
| `@type.builtin`          | `cyan_dim`     | italic  |
| `@property`              | `blue_soft`    |         |
| `@field`                 | `blue_soft`    |         |
| `@parameter`             | `blue_soft`    |         |
| `@constructor`           | `cyan_bright`  |         |
| `@tag`                   | `blue_electric`|         |
| `@tag.attribute`         | `cyan_dim`     |         |
| `@tag.delimiter`         | `comment`      |         |
| `@punctuation.bracket`   | `comment`      |         |
| `@punctuation.delimiter` | `comment`      |         |
| `@comment`               | `comment`      | italic  |
| `@constant`              | `orange`       |         |
| `@constant.builtin`      | `orange`       | italic  |
| `@operator`              | `cyan_dim`     |         |

### Plugin Groups (carried forward, not redesigned)

Telescope, Harpoon, and Undotree groups remain as currently defined. They reference palette variables, so they will pick up any renamed/changed palette keys automatically. Their design is not being revisited in this scope.

## File Changed

- `colors/tron.lua` — full rewrite

## Out of Scope

- Plugin-specific highlight groups (Telescope, Harpoon, Undotree styling beyond what exists)
- Terminal colors (g:terminal_color_*)
- Lualine / statusline plugin theming
