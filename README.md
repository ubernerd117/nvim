# Neovim Config Quick Lookup

Leader key: `Space`

## Quick Start

- Open file explorer: `<leader>pv`
- Split window: `:sp` (horizontal), `:vs` (vertical)
- Switch buffers: `:bnext` / `:bprev`, or `Ctrl-^` (last buffer)
- Toggle terminal: `<leader>t`
- Float terminal: `<leader>ft`
- Lazygit: `<leader>lg`
- Leave terminal insert mode: `Esc Esc` (double-escape)
- Close buffer: `:bd`

## Keymaps

- Open file explorer: `<leader>pv`
- Navigate splits: `Ctrl-h/j/k/l` (normal mode)
- Navigate splits from terminal: `Ctrl-h/j/k/l` (terminal mode)

## Plugins

### Telescope (fuzzy finder)
- Find files: `<leader>ff`
- Live grep: `<leader>fg`
- Buffers: `<leader>fb`
- Git status: `<leader>fs`
- Git commits: `<leader>fc`

### Harpoon (file marks)
- Add file: `<leader>a`
- Toggle quick menu: `Ctrl-e`
- Jump to mark 1-4: `Ctrl-h`, `Ctrl-t`, `Ctrl-n`, `Ctrl-s`
- Prev/next mark: `Ctrl-Shift-P`, `Ctrl-Shift-N`

### Snacks.nvim (terminal + lazygit + notifications)
- Toggle bottom terminal: `<leader>t`
- Toggle floating terminal: `<leader>ft`
- Open lazygit: `<leader>lg`

### UndoTree
- Toggle undo tree: `<leader>u`

### Which-key
- Press `<leader>` and pause to see all keybindings

### Treesitter
- Start selection: `Ctrl-Space`
- Expand selection: `Ctrl-Space`
- Shrink selection: `Backspace`

## LSP

- Hover docs: `K`
- Go to definition: `gd`
- Code action: `<leader>ca`

## Autocompletion (blink.cmp)

- Navigate menu: `Ctrl-n` / `Ctrl-p`
- Confirm selection: `Enter`
- Sources: LSP, file paths, current buffer

## Formatting (conform.nvim)

- Auto-formats on save
- JS/TS/JSON/CSS: Biome
- Lua: stylua (`brew install stylua`)
- Go/Rust/Python: LSP fallback
- Check active formatter: `:ConformInfo`

## Git Signs (gitsigns.nvim)

- Added/changed/deleted lines shown in the gutter automatically
- Next hunk: `]c`
- Previous hunk: `[c`

## Notes

- Treesitter installs parsers for: json, javascript, typescript, tsx, yaml, html, css, markdown, bash, lua, vim, dockerfile, gitignore, c, rust.
- Mason ensures LSP servers: `lua_ls`, `ts_ls`, `biome`, `pyright`, `gopls`, `rust_analyzer`.
