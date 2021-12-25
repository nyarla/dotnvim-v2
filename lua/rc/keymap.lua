-- functions

local function nnoremap(key, action)
  vim.api.nvim_set_keymap("n", key, action, {noremap = true, silent = true})
end

local function vnoremap(key, action)
  vim.api.nvim_set_keymap("v", key, action, {noremap = true, silent = true})
end

local function nmap(key, action)
  vim.api.nvim_set_keymap("n", key, action, {noremap = false, silent = true})
end

local function vmap(key, action)
  vim.api.nvim_set_keymap("v", key, action, {noremap = false, silent = true})
end

-- bindings

vnoremap("zs", ":sort<CR>")
vnoremap("zS", ":sort!<CR>")

nnoremap("<C-n>",":NvimTreeToggle<CR>")
