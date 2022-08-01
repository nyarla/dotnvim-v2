local DOTNVIM = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h")
local function include(path)
  vim.cmd(vim.fn.printf("source %s", DOTNVIM .. "/" .. path))
end

local set = vim.opt

include("vim/rc/plugins.vim")

require("rc.colorscheme")

set.number = false
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 2
set.softtabstop = 2
set.autoindent = true
