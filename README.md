# Neovim Config Quick Lookup

Leader key: `Space`

## Quick Start

- Open file explorer: `<leader>pv`
- Split window: `:sp` (horizontal), `:vs` (vertical)
- Switch buffers: `:bnext` / `:bprev`, or `Ctrl-^` (last buffer)
- Open terminal: `:terminal`
- Leave terminal insert mode: `Ctrl-\\` then `Ctrl-n`
- Back to terminal insert mode: `i` (in terminal buffer)
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

### UndoTree
- Toggle undo tree: `<leader>u`

### Treesitter
- Start selection: `Ctrl-Space`
- Expand selection: `Ctrl-Space`
- Shrink selection: `Backspace`

## LSP

- Hover docs: `K`
- Go to definition: `gd`
- Code action: `<leader>ca`

## Notes

- Treesitter installs parsers for: json, javascript, typescript, tsx, yaml, html, css, markdown, bash, lua, vim, dockerfile, gitignore, c, rust.
- Mason ensures LSP servers: `lua_ls`, `biome`, `pyright`.
