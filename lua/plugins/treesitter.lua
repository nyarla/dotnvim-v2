local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = {"perl"},
  highlight = {
    enable = true,
    disable = {"perl"},
    additional_vim_regex_highlighting = true
  }
}
