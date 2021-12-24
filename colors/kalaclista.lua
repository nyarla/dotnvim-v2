local eval = vim.cmd
local set = vim.opt
local global = vim.g

local colors = {
  dark = {"00", "#000000"},
  gray = {"08", "#666666"},
  light = {"07", "#F9F9F9"},
  bright = {"15", "#FFFFFF"},
  red = {"01", "#FF6633"},
  green = {"02", "#CCFF00"},
  yellow = {"03", "#FFCC33"},
  blue = {"04", "#00CCFF"},
  magenta = {"05", "#CC99CC"},
  cyan = {"06", "#00CCCC"},
  NONE = {"NONE", "NONE"}
}

local function apply(group, fg, bg, attr)
  local codes = {"hi", group}
  local foreground = colors[fg]

  if (fg ~= "") then
    codes[#codes + 1] = "ctermfg=" .. colors[fg][1] .. " guifg=" .. colors[fg][2]
  end

  if (bg ~= "") then
    codes[#codes + 1] = "ctermbg=" .. colors[bg][1] .. " guibg=" .. colors[bg][2]
  end

  if (attr ~= "") then
    codes[#codes + 1] = "cterm=" .. attr .. " gui=" .. attr
  end

  eval(table.concat(codes, " "))
end

if (vim.fn.exists("syntax_on")) then
  eval("syntax reset")
end

global.color_name = "kalaclista"

global.terminal_color_0 = colors["dark"][1]
global.terminal_color_1 = colors["red"][1]
global.terminal_color_2 = colors["green"][1]
global.terminal_color_3 = colors["yellow"][1]
global.terminal_color_4 = colors["blue"][1]
global.terminal_color_5 = colors["magenta"][1]
global.terminal_color_6 = colors["cyan"][1]
global.terminal_color_7 = colors["light"][1]
global.terminal_color_8 = colors["gray"][1]
global.terminal_color_9 = colors["red"][1]
global.terminal_color_10 = colors["green"][1]
global.terminal_color_11 = colors["yellow"][1]
global.terminal_color_12 = colors["blue"][1]
global.terminal_color_13 = colors["magenta"][1]
global.terminal_color_14 = colors["cyan"][1]
global.terminal_color_15 = colors["bright"][1]
global.terminal_color_background = colors["dark"][1]
global.terminal_color_foreground = colors["light"][1]

-- Interface
-- =========

-- text
apply("Normal", "light", "", "")
apply("Bold", "", "", "bold")
apply("Directory", "cyan", "", "")
apply("NonText", "gray", "", "bold")
apply("SpecialKey", "cyan", "", "bold")

-- msg
apply("MoreMsg", "green", "", "bold")
apply("ModeMsg", "blue", "", "bold")
apply("Question", "blue", "", "bold")
apply("MatchPattern", "dark", "blue", "bold")
apply("Error", "bright", "red", "bold")
apply("ErrorMsg", "red", "dark", "")
apply("WarningMsg", "yellow", "dark", "bold")

-- UI
apply("Cursor", "dark", "green", "bold")
apply("Visual", "dark", "blue", "")

apply("LineNr", "gray", "dark", "")
apply("LineNrAbove", "gray", "dark", "")
apply("LineNrBelow", "gray", "dark", "")
apply("CursorLine", "NONE", "NONE", "NONE")
apply("CursorLineNr", "bright", "dark", "")

apply("Search", "NONE", "NONE", "bold,underline")
apply("IncSearch", "NONE", "NONE", "bold,underline")

apply("VertSplit", "bright", "NONE", "bold")
apply("SignColumn", "", "dark", "NONE")

apply("Pmenu", "bright", "dark", "NONE")
apply("PmenuSel", "dark", "bright", "NONE")
apply("PmenuSbar", "NONE", "gray", "NONE")
apply("PmenuThumb", "NONE", "bright", "NONE")

apply("StatusLine", "bright", "dark", "bold")
apply("StatusLineNC", "bright", "dark", "NONE")

-- Syntax
-- ======

-- meta
apply("Title", "light", "", "bold")
apply("Comment", "light", "dark", "")

apply("Constant", "bright", "", "NONE")
apply("String", "yellow", "", "NONE")
apply("Character", "blue", "", "")
apply("Number", "yellow", "", "")
apply("Float", "yellow", "", "")
apply("Boolean", "green", "", "")

apply("Identifier", "light", "", "bold")
apply("Function", "cyan", "", "bold")

-- statements
apply("Statement", "green", "", "NONE")
apply("Operator", "", "", "bold")

-- preproc
apply("PreProc", "yellow", "", "NONE")

-- types
apply("Type", "cyan", "", "NONE")

-- special
apply("Special", "blue", "", "NONE")

-- others
apply("Underlined", "", "", "bold")
apply("Ignore", "gray", "", "")
apply("Todo", "dark", "yellow", "")

-- html
apply("htmlTag", "blue", "", "")
apply("htmlEndTag", "blue", "", "")

-- xml
apply("xmlTag", "blue", "", "")
apply("xmlEndTag", "blue", "", "")
apply("xmlTagName", "green", "", "")

-- yaml
apply("yamlBool", "green", "", "")
apply("yamlBlockMappingKey", "light", "", "NONE")
apply("yamlFlowMappingKey", "light", "", "NONE")

-- markdown
apply("markdownHeadingDelimiter", "green", "", "bold")
apply("markdownLink", "yellow", "", "")

-- perl
apply("perlIdentifier", "light", "", "NONE")
apply("perlOperator", "blue", "", "NONE")
apply("perlSubName", "blue", "", "bold")
apply("perlPackageDecl", "blue", "", "")
apply("perlStatementPackage", "green", "", "")
