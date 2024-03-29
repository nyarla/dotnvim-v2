local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})

require("nvim-tree").setup {
  disable_netrw = true,
  view = {
    side = "left"
  },
  git = {
    ignore = false
  }
}
