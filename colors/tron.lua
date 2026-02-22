-- Tron Legacy Theme (ENCOM/Dillinger)
-- Inspired by the Grid.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "tron"

-- Palette Definition
local p = {
	-- ENCOM (The Good Guys)
	bg = "#000000", -- True Black (The Void)
	fg = "#E0F7FA", -- White with a hint of cyan
	cursor = "#00FFFF", -- Tron Cyan
	
	cyan_bright = "#00FFFF",
	cyan_dim = "#00BCD4",
	blue_electric = "#2979FF",
	blue_soft = "#4FC3F7",
	blue_grey = "#607D8B", -- Comments

	-- Dillinger (The Bad Guys / Errors / Constants)
	red_neon = "#FF3D00",
	red_dark = "#D50000",
	orange_neon = "#FF9100",
	yellow_neon = "#FFEA00",

    -- UI Elements
    grey_dark = "#102027", -- Very dark blue-grey for panels
    grey_mid = "#37474F",
}

local groups = {
	-- Base
	Normal = { fg = p.fg, bg = p.bg },
	NormalFloat = { fg = p.fg, bg = p.grey_dark }, -- Floating windows
    FloatBorder = { fg = p.cyan_bright, bg = p.bg },
	Cursor = { fg = p.bg, bg = p.cursor },
	CursorLine = { bg = "#051015" }, -- Very subtle blue tint
	CursorColumn = { bg = "#051015" },

	-- Line Numbers
	LineNr = { fg = p.grey_mid },
	CursorLineNr = { fg = p.cyan_bright, bold = true },

	-- Syntax
	Comment = { fg = p.blue_grey, italic = true },
	Constant = { fg = p.orange_neon }, -- Numbers, Booleans (Dillinger data)
	String = { fg = p.yellow_neon }, -- Data streams
	Character = { fg = p.yellow_neon },
	Number = { fg = p.orange_neon },
	Boolean = { fg = p.orange_neon },
	Float = { fg = p.orange_neon },

	Identifier = { fg = p.fg }, -- Variables
	Function = { fg = p.cyan_bright, bold = true }, -- Programs

	Statement = { fg = p.blue_electric }, -- if, else, while
	Conditional = { fg = p.blue_electric },
	Repeat = { fg = p.blue_electric },
	Label = { fg = p.blue_electric },
	Operator = { fg = p.cyan_dim },
	Keyword = { fg = p.blue_electric, italic = true },
	Exception = { fg = p.red_neon },

	PreProc = { fg = p.blue_soft }, -- include, define
	Include = { fg = p.blue_soft },
	Define = { fg = p.blue_soft },
	Macro = { fg = p.blue_soft },
	PreCondit = { fg = p.blue_soft },

	Type = { fg = p.cyan_dim }, -- int, long, char
	StorageClass = { fg = p.cyan_dim },
	Structure = { fg = p.cyan_dim },
	Typedef = { fg = p.cyan_dim },

	Special = { fg = p.orange_neon },
	SpecialChar = { fg = p.orange_neon },
	Tag = { fg = p.orange_neon },
	Delimiter = { fg = p.blue_grey },
	SpecialComment = { fg = p.blue_grey },
	Debug = { fg = p.red_neon },

	Underlined = { underline = true },
	Ignore = {},
	Error = { fg = p.red_neon, bg = p.bg, bold = true },
	Todo = { fg = p.bg, bg = p.cyan_bright, bold = true },

	-- Pmenu (Popup Menu)
	Pmenu = { fg = p.fg, bg = p.grey_dark },
	PmenuSel = { fg = p.bg, bg = p.cyan_bright },
	PmenuSbar = { bg = p.grey_dark },
	PmenuThumb = { bg = p.cyan_dim },

	-- Search
	Search = { fg = p.bg, bg = p.yellow_neon },
	IncSearch = { fg = p.bg, bg = p.orange_neon },
    CurSearch = { fg = p.bg, bg = p.orange_neon },

	-- Visual
	Visual = { bg = "#003344" }, -- Deep cyan selection

	-- Git / Diff
	DiffAdd = { fg = p.cyan_bright, bg = "#002222" },
	DiffChange = { fg = p.yellow_neon, bg = "#222200" },
	DiffDelete = { fg = p.red_neon, bg = "#220000" },
	DiffText = { fg = p.bg, bg = p.yellow_neon },

    -- Diagnostics (LSP)
    DiagnosticError = { fg = p.red_neon },
    DiagnosticWarn = { fg = p.orange_neon },
    DiagnosticInfo = { fg = p.cyan_bright },
    DiagnosticHint = { fg = p.blue_soft },
    DiagnosticUnderlineError = { sp = p.red_neon, underline = true },
    DiagnosticUnderlineWarn = { sp = p.orange_neon, underline = true },
    
    -- Treesitter Overrides (Linking to standard groups mostly, but can be specific)
    ["@variable"] = { fg = p.fg },
    ["@variable.builtin"] = { fg = p.cyan_dim },
    ["@function.builtin"] = { fg = p.cyan_bright },
    ["@keyword.function"] = { fg = p.blue_electric, italic = true },
    ["@tag"] = { fg = p.blue_electric },
    ["@tag.attribute"] = { fg = p.cyan_dim },
    ["@tag.delimiter"] = { fg = p.blue_grey },

    -- Telescope
    TelescopeNormal = { bg = p.bg },
    TelescopeBorder = { fg = p.cyan_bright, bg = p.bg },
    TelescopePromptNormal = { fg = p.cyan_bright },
    TelescopePromptBorder = { fg = p.orange_neon }, -- Dillinger intruding?
    TelescopeTitle = { fg = p.bg, bg = p.cyan_bright },
    TelescopePreviewTitle = { fg = p.bg, bg = p.blue_soft },
    TelescopePromptTitle = { fg = p.bg, bg = p.orange_neon },
    TelescopeSelection = { bg = "#003344", fg = p.cyan_bright },

    -- Harpoon
    HarpoonWindow = { fg = p.fg, bg = p.grey_dark },
    HarpoonBorder = { fg = p.cyan_dim },

    -- Undotree
    UndotreeNode = { fg = p.cyan_bright },
    UndotreeNodeCurrent = { fg = p.orange_neon, bold = true },
    UndotreeSeq = { fg = p.blue_grey },
    UndotreeBranch = { fg = p.blue_electric },
}

for group, settings in pairs(groups) do
	vim.api.nvim_set_hl(0, group, settings)
end
