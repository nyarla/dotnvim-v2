local global = vim.g
local eval = vim.cmd
local define = require("colors.define")

local function assign(name, fg, bg, options)
  if (fg ~= "") then
    options["fg"] = define[fg]["hex"]
  end

  if (bg ~= "") then
    options["bg"] = define[bg]["hex"]
  end

  vim.api.nvim_set_hl(0, name, options)
end

local function bind(src, dest)
  local opts = {default = true}
  opts["link"] = dest

  vim.api.nvim_set_hl(0, src, opts)
end

if (vim.fn.exists("syntax_on")) then
  eval("syntax reset")
end

global.color_name = "kalaclista"

-- Terminal
-- ========
global.terminal_color_0 = define["dark"]["hex"]
global.terminal_color_1 = define["red"]["hex"]
global.terminal_color_2 = define["green"]["hex"]
global.terminal_color_3 = define["yellow"]["hex"]
global.terminal_color_4 = define["blue"]["hex"]
global.terminal_color_5 = define["magenta"]["hex"]
global.terminal_color_6 = define["cyan"]["hex"]
global.terminal_color_7 = define["light"]["hex"]
global.terminal_color_8 = define["gray"]["hex"]
global.terminal_color_9 = define["red"]["hex"]
global.terminal_color_10 = define["green"]["hex"]
global.terminal_color_11 = define["yellow"]["hex"]
global.terminal_color_12 = define["blue"]["hex"]
global.terminal_color_13 = define["magenta"]["hex"]
global.terminal_color_14 = define["cyan"]["hex"]
global.terminal_color_15 = define["bright"]["hex"]
global.terminal_color_background = define["dark"]["hex"]
global.terminal_color_foreground = define["light"]["hex"]

-- Interface
-- =========

-- msg
assign("Normal", "light", "", {})
assign("Bold", "", "", {bold = true})
assign("Directory", "cyan", "", {})
assign("NonText", "gray", "", {bold = true})
assign("SpecialKey", "cyan", "", {bold = true})

-- UI
assign("MoreMsg", "green", "", {bold = true})
assign("ModeMsg", "blue", "", {bold = true})
assign("Question", "blue", "", {bold = true})
assign("MatchParen", "dark", "green", {underline = true})
assign("Error", "bright", "red", {bold = true})
assign("ErrorMsg", "red", "dark", {})
assign("WarningMsg", "yellow", "dark", {})

assign("Cursor", "dark", "blue", {bold = true})
assign("Visual", "dark", "blue", {})

assign("LineNr", "gray", "dark", {})
assign("LineNrAbove", "gray", "dark", {})
assign("LineNrBelow", "gray", "dark", {})
assign("CursorLine", "", "", {})
assign("CursorLineNr", "bright", "dark", {bold = true})

assign("Search", "", "", {bold = true, underline = true})
assign("IncSearch", "", "", {bold = true, underline = true})

assign("VertSplit", "bright", "", {})
assign("SignColumn", "", "dark", {})

assign("Pmenu", "bright", "gray", {})
assign("PmenuSel", "dark", "bright", {})
assign("PmenuSbar", "", "gray", {})
assign("PmenuThumb", "", "bright", {})

assign("StatusLine", "bright", "dark", {bold = true})
assign("StatusLineNC", "bright", "dark", {})

-- nvim-cmp
assign("CmpItemAbbr", "bright", "", {})
assign("CmpItemAbbrDefault", "bright", "", {})

assign("CmpItemAbbrDeprecated", "magenta", "", {})
assign("CmpItemAbbrDeprecatedDefault", "magenta", "", {})

assign("CmpItemAbbrMatch", "dark", "cyan", {bold = true})
assign("CmpItemAbbrMatchDefault", "dark", "cyan", {bold = true})

assign("CmpItemAbbrMatchFuzzy", "bright", "", {bold = true, underline = true})
assign("CmpItemAbbrMatchFuzzyDefault", "bright", "", {bold = true, underline = true})

assign("CmpItemKind", "blue", "", {})
assign("CmpItemKindDefault", "blue", "", {})

assign("CmpItemMenu", "bright", "", {})
assign("CmpItemMenuDefault", "bright", "", {})

-- Syntax
-- ======

-- meta
assign("Title", "light", "", {bold = true})
assign("Comment", "gray", "", {bold = true})

assign("Constant", "bright", "", {})
assign("String", "yellow", "", {})
assign("Character", "blue", "", {})
assign("Number", "green", "", {})
assign("Float", "green", "", {})
assign("Boolean", "green", "", {bold = true})

assign("Identifier", "light", "", {bold = true})
assign("Function", "blue", "", {bold = true})

assign("Statement", "green", "", {})
assign("Operator", "", "", {bold = true})

assign("PreProc", "yellow", "", {})
assign("Type", "green", "", {})
assign("Special", "magenta", "", {})

assign("Underlined", "", "", {underline = true})
assign("Ignore", "gray", "", {})
assign("Todo", "dark", "yellow", {})

-- FileTypes
-- =========
assign("htmlTag", "blue", "", {})
assign("htmlEndTag", "blue", "", {})

assign("xmlTag", "blue", "", {})
assign("xmlEndTag", "blue", "", {})
assign("xmlTagName", "green", "", {})

assign("yamlBool", "blue", "", {})

assign("markdownHeadingDelimiter", "green", "", {bold = true})
assign("markdownUrl", "blue", "", {})

assign("perlIdentifier", "darkblue", "", {})
