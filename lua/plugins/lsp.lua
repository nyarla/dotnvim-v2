local cmp = require("cmp")
local kind = require("lspkind")

local icons = {
  vim_lsp = "",
  path = "",
  treesitter = "滑",
  cmp_tabnine = "",
  buffer = "﬘",
  vsnip = "",
  omni = ""
}

local g = vim.g
g.lsp_diagnostics_enabled = 1
g.lsp_diagnostics_echo_cursor = 1
g.lsp_diagnostics_echo_delay = 200
g.lsp_settings = {
  ["efm-langserver"] = {
    disabled = false,
    allowlist = {"markdown"}
  }
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
    {name = "buffer"},
    {name = "vsnip"},
    {name = "omni"}
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
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
