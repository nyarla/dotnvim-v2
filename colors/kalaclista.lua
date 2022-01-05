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
apply("MatchParen", "dark", "green", "underline")
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

apply("Pmenu", "bright", "gray", "NONE")
apply("PmenuSel", "dark", "bright", "NONE")
apply("PmenuSbar", "NONE", "gray", "NONE")
apply("PmenuThumb", "NONE", "bright", "NONE")

apply("StatusLine", "bright", "dark", "bold")
apply("StatusLineNC", "bright", "dark", "NONE")

-- nvim-cmp
apply("CmpItemAbbr", "bright", "NONE", "NONE")
apply("CmpItemAbbrDefault", "bright", "NONE", "NONE")

apply("CmpItemAbbrDeprecated", "magenta", "NONE", "NONE")
apply("CmpItemAbbrDeprecatedDefault", "magenta", "NONE", "NONE")

apply("CmpItemAbbrMatch", "dark", "cyan", "bold")
apply("CmpItemAbbrMatchDefault", "dark", "cyan", "bold")

apply("CmpItemAbbrMatchFuzzy", "bright", "NONE", "bold,underline")
apply("CmpItemAbbrMatchFuzzyDefault", "bright", "NONE", "bold,underline")

apply("CmpItemKind", "blue", "NONE", "NONE")
apply("CmpItemKindDefault", "blue", "NONE", "NONE")

apply("CmpItemMenu", "bright", "NONE", "NONE")
apply("CmpItemMenuDefault", "bright", "NONE", "NONE")

-- Syntax
-- ======

-- meta
apply("Title", "light", "", "bold")
apply("Comment", "gray", "dark", "bold")

apply("Constant", "bright", "", "NONE")
apply("String", "yellow", "", "NONE")
apply("Character", "blue", "", "")
apply("Number", "yellow", "", "")
apply("Float", "yellow", "", "")
apply("Boolean", "green", "", "")

apply("Identifier", "light", "", "bold")
apply("Function", "cyan", "", "bold")

-- treesitter
apply("TSAttribute", "magenta", "", "")
apply("TSBoolean", "green", "", "")
apply("TSCharacter", "blue", "", "")
apply("TSComment", "light", "dark", "")
apply("TSConditional", "green", "", "NONE")
apply("TSConstBuiltin", "", "", "bold")
apply("TSConstMacro", "blue", "", "bold")
apply("TSConstant", "bright", "", "NONE")
apply("TSConstructer", "blue", "", "")
apply("TSDanger", "red", "", "bold")
apply("TSEmphasis", "", "", "bold")
apply("TSEnvironment", "cyan", "", "")
apply("TSEnvironmentName", "green", "", "")
apply("TSError", "dark", "red", "bold")
apply("TSException", "green", "", "")
apply("TSField", "light", "", "")
apply("TSFloat", "yellow", "", "")
apply("TSFuncBuiltin", "cyan", "", "bold")
apply("TSFuncBuiltin", "cyan", "", "italic")
apply("TSFunction", "cyan", "", "")
apply("TSInclude", "green", "", "")
apply("TSKeyword", "green", "", "")
apply("TSKeywordFunction", "green", "", "")
apply("TSKeywordOperator", "light", "", "bold")
apply("TSKeywordReturn", "red", "", "")
apply("TSLabel", "green", "", "bold")
apply("TSLitetal", "yellow", "", "")
apply("TSMethod", "light", "", "")
apply("TSNamespace", "light", "", "bold")
apply("TSNote", "dark", "yellow", "")
apply("TSNumber", "yellow", "", "")
apply("TSOperator", "light", "", "bold")
apply("TSParameter", "light", "", "bold")
apply("TSProperty", "light", "", "")
apply("TSPuncSpecial", "", "", "bold")
apply("TSPunctBracket", "", "", "bold")
apply("TSPunctDelimiter", "", "", "bold")
apply("TSRepeat", "green", "", "")
apply("TSStirng", "yellow", "", "")
apply("TSStrike", "", "", "strikethrough")
apply("TSStringEscape", "cyan", "", "")
apply("TSStringRegex", "cyan", "", "")
apply("TSStringSpecial", "blue", "", "")
apply("TSSymbol", "cyan", "", "")
apply("TSTag", "blue", "", "")
apply("TSTagAttribute", "green", "", "")
apply("TSTagDelimiter", "light", "", "bold")
apply("TSText", "light", "", "")
apply("TSTitle", "", "", "bold")
apply("TSType", "", "", "bold")
apply("TSURI", "green", "", "")
apply("TSUnderline", "", "", "underline")
apply("TSVariableBuiltin", "", "", "bold")
apply("TSWarning", "magenta", "", "bold")

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
