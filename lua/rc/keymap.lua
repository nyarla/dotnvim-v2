-- functions

local function nnoremap(key, action)
  vim.api.nvim_set_keymap("n", key, action, {noremap = true, silent = true})
end

local function inoremap(key, action)
  vim.api.nvim_set_keymap("i", key, action, {noremap = true, silent = true})
end

local function tnoremap(key, action)
  vim.api.nvim_set_keymap("t", key, action, {noremap = true, silent = true})
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

nnoremap("<C-n>", ":NvimTreeToggle<CR>")

nnoremap("<C-t>c", "<Esc>:tabnew<CR>")
inoremap("<C-t>c", "<Esc>:tabnew<CR>")
tnoremap("<C-t>c", "<C-\\><C-n>:tabnew<CR>")

nnoremap("<C-t>t", "<Esc>:tabnew<CR>:terminal<CR>")
inoremap("<C-t>t", "<Esc>:tabnew<CR>:terminal<CR>")
tnoremap("<C-t>t", "<C-\\><C-n>:tabnew<CR>:terminal<CR>")

nnoremap("<C-t>x", "<Esc>:tabclose<CR>")
inoremap("<C-t>x", "<Esc>:tabclose<CR>")
tnoremap("<C-t>x", "<C-\\><C-n>:tabclose<CR>")

nnoremap("<C-t>1", "<Esc>1gt")
inoremap("<C-t>1", "<Esc>1gt")
tnoremap("<C-t>1", "<C-\\><C-n>1gt")

nnoremap("<C-t>2", "<Esc>2gt")
inoremap("<C-t>2", "<Esc>2gt")
tnoremap("<C-t>2", "<C-\\><C-n>2gt")

nnoremap("<C-t>3", "<Esc>3gt")
inoremap("<C-t>3", "<Esc>3gt")
tnoremap("<C-t>3", "<C-\\><C-n>3gt")

nnoremap("<C-t>4", "<Esc>4gt")
inoremap("<C-t>4", "<Esc>4gt")
tnoremap("<C-t>4", "<C-\\><C-n>4gt")

nnoremap("<C-t>5", "<Esc>5gt")
inoremap("<C-t>5", "<Esc>5gt")
tnoremap("<C-t>5", "<C-\\><C-n>5gt")

nnoremap("<C-t>6", "<Esc>6gt")
inoremap("<C-t>6", "<Esc>6gt")
tnoremap("<C-t>6", "<C-\\><C-n>6gt")

nnoremap("<C-t>7", "<Esc>7gt")
inoremap("<C-t>7", "<Esc>7gt")
tnoremap("<C-t>7", "<C-\\><C-n>7gt")

nnoremap("<C-t>8", "<Esc>8gt")
inoremap("<C-t>8", "<Esc>8gt")
tnoremap("<C-t>8", "<C-\\><C-n>8gt")

nnoremap("<C-t>9", "<Esc>9gt")
inoremap("<C-t>9", "<Esc>9gt")
tnoremap("<C-t>9", "<C-\\><C-n>9gt")
