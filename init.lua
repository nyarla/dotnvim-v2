local DOTNVIM = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h")
local function include(path)
  vim.cmd(vim.fn.printf("source %s", DOTNVIM .. "/" .. path))
end

include("vim/rc/plug.vim")

require("rc.colorscheme")
require("rc.options")
require("rc.keymap")

require("plugins.file-manager")
require("plugins.auto-format")
require("plugins.lsp")
require("plugins.lualine")
