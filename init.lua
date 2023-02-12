local DOTNVIM = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h")
local function include(path)
  vim.cmd(vim.fn.printf("source %s", DOTNVIM .. "/" .. path))
end

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

include("vim/rc/plug.vim")

require("rc.colorscheme")
require("rc.options")
require("rc.keymap")

require("plugins.nvim-tree")
require("plugins.auto-format")
require("plugins.lsp")
require("plugins.lualine")
