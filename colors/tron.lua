-- Tron Legacy Theme — Spectrum Redesign
-- Blue/Cyan = Good | Amber = Caution | Red = Danger (Ares)

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "tron"

-- Palette — Semantic Spectrum
local p = {
	-- Cool Zone (The Grid — healthy circuits)
	cyan_bright   = "#00FFFF",
	cyan_dim      = "#00BCD4",
	blue_electric = "#2979FF",
	blue_soft     = "#4FC3F7",

	-- Warm Zone (Data streams — caution)
	amber      = "#FFD600",
	amber_deep = "#FFA000",
	orange     = "#FF9100",

	-- Hot Zone (Ares — danger)
	red_neon   = "#FF1744",
	red_orange = "#FF3D00",

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

local groups = {
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
}

for group, settings in pairs(groups) do
	vim.api.nvim_set_hl(0, group, settings)
end
