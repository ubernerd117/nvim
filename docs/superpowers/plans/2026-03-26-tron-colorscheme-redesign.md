# Tron Colorscheme Redesign — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rewrite the Tron Legacy colorscheme with a semantic color spectrum (blue=good → yellow=caution → red=danger), subtle glow treatments, and full core highlight group coverage.

**Architecture:** Single-file rewrite of `colors/tron.lua`. The file has three sections: palette table, highlight groups table, and the apply loop. We rewrite the palette and groups in place, keeping the same structure. Plugin groups (Telescope, Harpoon, Undotree) are carried forward and updated to reference the new palette keys.

**Tech Stack:** Lua, Neovim highlight API (`nvim_set_hl`)

**Spec:** `docs/superpowers/specs/2026-03-26-tron-colorscheme-redesign.md`

---

### Task 1: Rewrite the palette

**Files:**
- Modify: `colors/tron.lua:12-34` (palette table)

- [ ] **Step 1: Replace the palette table**

Replace the entire `local p = { ... }` block (lines 12–34) with the new spectrum-based palette:

```lua
local p = {
	-- Cool Zone (The Grid — healthy circuits)
	cyan_bright = "#00FFFF",
	cyan_dim    = "#00BCD4",
	blue_electric = "#2979FF",
	blue_soft   = "#4FC3F7",

	-- Warm Zone (Data streams — caution)
	amber       = "#FFD600",
	amber_deep  = "#FFA000",
	orange      = "#FF9100",

	-- Hot Zone (Ares — danger)
	red_neon    = "#FF1744",
	red_orange  = "#FF3D00",

	-- Neutrals (The Void)
	bg          = "#000000",
	fg          = "#E0F7FA",
	cursorline  = "#060E14",
	panel       = "#0A1A24",
	surface     = "#1A2A34",
	muted       = "#37474F",
	comment     = "#546E7A",
	visual      = "#0A2A3A",
	diff_add_bg = "#002A2A",
	diff_chg_bg = "#2A2A00",
	diff_del_bg = "#2A0000",
	match_bg    = "#003344",
}
```

- [ ] **Step 2: Verify no syntax errors**

Run: `nvim --headless -c "luafile colors/tron.lua" -c "q" 2>&1`
Expected: No output (no errors)

- [ ] **Step 3: Commit**

```bash
git add colors/tron.lua
git commit -m "feat(tron): rewrite palette with semantic spectrum"
```

---

### Task 2: Rewrite base UI groups

**Files:**
- Modify: `colors/tron.lua` (the `groups` table — base/UI section)

- [ ] **Step 1: Replace the base UI and line number sections**

Replace the `-- Base` and `-- Line Numbers` sections (currently lines 37–47) in the `groups` table with:

```lua
	-- Base
	Normal       = { fg = p.fg, bg = p.bg },
	NormalFloat  = { fg = p.fg, bg = p.panel },
	FloatBorder  = { fg = p.cyan_bright, bg = p.bg },
	Cursor       = { fg = p.bg, bg = p.cyan_bright },
	CursorLine   = { bg = p.cursorline },
	CursorColumn = { bg = p.cursorline },
	Visual       = { bg = p.visual },
	SignColumn   = { bg = p.bg },
	FoldColumn   = { fg = p.muted },
	Folded       = { fg = p.blue_soft, bg = p.panel },
	VertSplit    = { fg = p.surface },
	WinSeparator = { fg = p.surface },
	NonText      = { fg = p.surface },
	EndOfBuffer  = { fg = p.surface },
	SpecialKey   = { fg = p.muted },
	MatchParen   = { fg = p.cyan_bright, bg = p.match_bg, bold = true },
	Title        = { fg = p.cyan_bright, bold = true },
	Directory    = { fg = p.blue_electric },
	WildMenu     = { fg = p.bg, bg = p.cyan_bright },
	Question     = { fg = p.cyan_bright },
	MoreMsg      = { fg = p.cyan_dim },
	ModeMsg      = { fg = p.cyan_dim },
	WarningMsg   = { fg = p.amber_deep },
	ErrorMsg     = { fg = p.red_neon, bold = true },

	-- Line Numbers
	LineNr       = { fg = p.muted },
	CursorLineNr = { fg = p.cyan_bright, bold = true },

	-- StatusLine
	StatusLine   = { fg = p.cyan_dim, bg = p.panel },
	StatusLineNC = { fg = p.muted, bg = p.cursorline },

	-- TabLine
	TabLine      = { fg = p.muted, bg = p.cursorline },
	TabLineSel   = { fg = p.cyan_bright, bg = p.panel, bold = true },
	TabLineFill  = { bg = p.bg },
```

- [ ] **Step 2: Verify no syntax errors**

Run: `nvim --headless -c "luafile colors/tron.lua" -c "q" 2>&1`
Expected: No output (no errors)

- [ ] **Step 3: Commit**

```bash
git add colors/tron.lua
git commit -m "feat(tron): add base UI groups with glow treatment"
```

---

### Task 3: Rewrite syntax groups

**Files:**
- Modify: `colors/tron.lua` (the `groups` table — syntax section)

- [ ] **Step 1: Replace the syntax section**

Replace the `-- Syntax` section (currently lines 49–90) with:

```lua
	-- Syntax
	Comment      = { fg = p.comment, italic = true },
	Constant     = { fg = p.orange },
	String       = { fg = p.amber },
	Character    = { fg = p.amber },
	Number       = { fg = p.orange },
	Boolean      = { fg = p.orange },
	Float        = { fg = p.orange },

	Identifier   = { fg = p.fg },
	Function     = { fg = p.cyan_bright, bold = true },

	Statement    = { fg = p.blue_electric },
	Conditional  = { fg = p.blue_electric },
	Repeat       = { fg = p.blue_electric },
	Label        = { fg = p.blue_electric },
	Operator     = { fg = p.cyan_dim },
	Keyword      = { fg = p.blue_electric, italic = true },
	Exception    = { fg = p.red_orange },

	PreProc      = { fg = p.blue_soft },
	Include      = { fg = p.blue_soft },
	Define       = { fg = p.blue_soft },
	Macro        = { fg = p.blue_soft },
	PreCondit    = { fg = p.blue_soft },

	Type         = { fg = p.cyan_dim },
	StorageClass = { fg = p.cyan_dim },
	Structure    = { fg = p.cyan_dim },
	Typedef      = { fg = p.cyan_dim },

	Special        = { fg = p.orange },
	SpecialChar    = { fg = p.orange },
	Tag            = { fg = p.orange },
	Delimiter      = { fg = p.comment },
	SpecialComment = { fg = p.comment },
	Debug          = { fg = p.red_orange },

	Underlined   = { underline = true },
	Ignore       = {},
	Error        = { fg = p.red_neon, bold = true },
	Todo         = { fg = p.bg, bg = p.cyan_bright, bold = true },
```

- [ ] **Step 2: Verify no syntax errors**

Run: `nvim --headless -c "luafile colors/tron.lua" -c "q" 2>&1`
Expected: No output (no errors)

- [ ] **Step 3: Commit**

```bash
git add colors/tron.lua
git commit -m "feat(tron): rewrite syntax groups with spectrum colors"
```

---

### Task 4: Rewrite popup, search, diff, and diagnostic groups

**Files:**
- Modify: `colors/tron.lua` (the `groups` table — Pmenu, Search, Visual, Diff, Diagnostics sections)

- [ ] **Step 1: Replace popup, search, diff, and diagnostic sections**

Replace the `-- Pmenu`, `-- Search`, `-- Visual`, `-- Git / Diff`, and `-- Diagnostics` sections (currently lines 92–118) with:

```lua
	-- Popup Menu
	Pmenu        = { fg = p.fg, bg = p.panel },
	PmenuSel     = { fg = p.bg, bg = p.cyan_bright },
	PmenuSbar    = { bg = p.panel },
	PmenuThumb   = { bg = p.cyan_dim },

	-- Search
	Search       = { fg = p.bg, bg = p.amber },
	IncSearch    = { fg = p.bg, bg = p.amber_deep },
	CurSearch    = { fg = p.bg, bg = p.amber_deep },

	-- Diff
	DiffAdd      = { fg = p.cyan_bright, bg = p.diff_add_bg },
	DiffChange   = { fg = p.amber, bg = p.diff_chg_bg },
	DiffDelete   = { fg = p.red_neon, bg = p.diff_del_bg },
	DiffText     = { fg = p.bg, bg = p.amber },

	-- Diagnostics (LSP)
	DiagnosticError          = { fg = p.red_neon },
	DiagnosticWarn           = { fg = p.amber_deep },
	DiagnosticInfo           = { fg = p.cyan_bright },
	DiagnosticHint           = { fg = p.blue_soft },
	DiagnosticUnderlineError = { sp = p.red_neon, undercurl = true },
	DiagnosticUnderlineWarn  = { sp = p.amber_deep, undercurl = true },
	DiagnosticUnderlineInfo  = { sp = p.cyan_bright, undercurl = true },
	DiagnosticUnderlineHint  = { sp = p.blue_soft, undercurl = true },
```

Note: `undercurl = true` replaces the old `underline = true` for diagnostics, and we add `Info` and `Hint` underline groups that were missing.

- [ ] **Step 2: Verify no syntax errors**

Run: `nvim --headless -c "luafile colors/tron.lua" -c "q" 2>&1`
Expected: No output (no errors)

- [ ] **Step 3: Commit**

```bash
git add colors/tron.lua
git commit -m "feat(tron): rewrite popup/search/diff/diagnostic groups"
```

---

### Task 5: Rewrite Treesitter groups

**Files:**
- Modify: `colors/tron.lua` (the `groups` table — Treesitter section)

- [ ] **Step 1: Replace the Treesitter section**

Replace the `-- Treesitter Overrides` section (currently lines 120–127) with:

```lua
	-- Treesitter
	["@variable"]              = { fg = p.fg },
	["@variable.builtin"]      = { fg = p.cyan_dim },
	["@variable.parameter"]    = { fg = p.blue_soft },
	["@function"]              = { fg = p.cyan_bright, bold = true },
	["@function.builtin"]      = { fg = p.cyan_bright },
	["@function.call"]         = { fg = p.cyan_bright },
	["@keyword"]               = { fg = p.blue_electric, italic = true },
	["@keyword.function"]      = { fg = p.blue_electric, italic = true },
	["@keyword.return"]        = { fg = p.blue_electric, italic = true },
	["@keyword.operator"]      = { fg = p.cyan_dim },
	["@string"]                = { fg = p.amber },
	["@number"]                = { fg = p.orange },
	["@boolean"]               = { fg = p.orange },
	["@type"]                  = { fg = p.cyan_dim },
	["@type.builtin"]          = { fg = p.cyan_dim, italic = true },
	["@property"]              = { fg = p.blue_soft },
	["@field"]                 = { fg = p.blue_soft },
	["@parameter"]             = { fg = p.blue_soft },
	["@constructor"]           = { fg = p.cyan_bright },
	["@tag"]                   = { fg = p.blue_electric },
	["@tag.attribute"]         = { fg = p.cyan_dim },
	["@tag.delimiter"]         = { fg = p.comment },
	["@punctuation.bracket"]   = { fg = p.comment },
	["@punctuation.delimiter"] = { fg = p.comment },
	["@comment"]               = { fg = p.comment, italic = true },
	["@constant"]              = { fg = p.orange },
	["@constant.builtin"]      = { fg = p.orange, italic = true },
	["@operator"]              = { fg = p.cyan_dim },
```

- [ ] **Step 2: Verify no syntax errors**

Run: `nvim --headless -c "luafile colors/tron.lua" -c "q" 2>&1`
Expected: No output (no errors)

- [ ] **Step 3: Commit**

```bash
git add colors/tron.lua
git commit -m "feat(tron): expand treesitter groups with spectrum mapping"
```

---

### Task 6: Update plugin groups to use new palette keys

**Files:**
- Modify: `colors/tron.lua` (the `groups` table — Telescope, Harpoon, Undotree sections)

- [ ] **Step 1: Replace plugin sections with updated palette references**

The plugin groups currently reference old palette keys (`p.grey_dark`, `p.blue_grey`, `p.orange_neon`). Replace the Telescope, Harpoon, and Undotree sections (currently lines 129–148) with:

```lua
	-- Telescope
	TelescopeNormal       = { bg = p.bg },
	TelescopeBorder       = { fg = p.cyan_bright, bg = p.bg },
	TelescopePromptNormal = { fg = p.cyan_bright },
	TelescopePromptBorder = { fg = p.orange },
	TelescopeTitle        = { fg = p.bg, bg = p.cyan_bright },
	TelescopePreviewTitle = { fg = p.bg, bg = p.blue_soft },
	TelescopePromptTitle  = { fg = p.bg, bg = p.orange },
	TelescopeSelection    = { bg = p.match_bg, fg = p.cyan_bright },

	-- Harpoon
	HarpoonWindow = { fg = p.fg, bg = p.panel },
	HarpoonBorder = { fg = p.cyan_dim },

	-- Undotree
	UndotreeNode        = { fg = p.cyan_bright },
	UndotreeNodeCurrent = { fg = p.orange, bold = true },
	UndotreeSeq         = { fg = p.comment },
	UndotreeBranch      = { fg = p.blue_electric },
```

- [ ] **Step 2: Verify no syntax errors**

Run: `nvim --headless -c "luafile colors/tron.lua" -c "q" 2>&1`
Expected: No output (no errors)

- [ ] **Step 3: Commit**

```bash
git add colors/tron.lua
git commit -m "feat(tron): update plugin groups for new palette keys"
```

---

### Task 7: Final verification

**Files:**
- Verify: `colors/tron.lua`

- [ ] **Step 1: Load the full colorscheme and check for errors**

Run: `nvim --headless -c "colorscheme tron" -c "q" 2>&1`
Expected: No output (no errors)

- [ ] **Step 2: Check that no old palette keys remain**

Run: `grep -n 'p\.cursor\|p\.blue_grey\|p\.red_dark\|p\.orange_neon\|p\.yellow_neon\|p\.grey_dark\|p\.grey_mid' colors/tron.lua`
Expected: No matches (all old keys have been replaced)

- [ ] **Step 3: Visual spot-check**

Open Neovim and load a Lua file to visually verify:
```bash
nvim colors/tron.lua
```
Confirm:
- Functions are bright cyan + bold
- Keywords are electric blue + italic
- Strings are amber (not harsh yellow)
- Comments are blue-grey + italic
- Cursor line has a faint cyan tint
- Line numbers are muted, current line number is bright cyan

- [ ] **Step 4: Final commit**

```bash
git add colors/tron.lua
git commit -m "feat(tron): complete spectrum-based colorscheme redesign"
```
