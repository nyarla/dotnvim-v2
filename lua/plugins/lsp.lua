local cmp = require("cmp")
local kind = require("lspkind")

local icons = {
  buffer = "﬘",
  cmp_tabnine = "",
  omni = "",
  path = "",
  treesitter = "滑",
  vim_lsp = ""
}

cmp.setup {
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
    ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ["<Left>"] = cmp.mapping.close(),
    ["<Right>"] = cmp.mapping.close(),
    ["<Up>"] = cmp.mapping.close(),
    ["<Down>"] = cmp.mapping.close()
  },
  sources = {
    {name = "vim_lsp"},
    {name = "path"},
    {name = "treesitter"},
    {name = "cmp_tabnine"},
    {name = "buffer"},
    {name = "omni"}
  },
  formatting = {
    format = kind.cmp_format(
      {
        width_text = false,
        maxwidth = 50,
        before = function(entry, item)
          item.kind = kind.presets.default[item.kind]
          local icon = icons[entry.source.name]

          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. " " .. icon
          end

          item.menu = menu

          return item
        end
      }
    )
  }
}
