local ls = require("null-ls")
local u = require("null-ls.utils")

ls.setup {
  debug = true,
  sources = {
    -- github actions
    ls.builtins.diagnostics.actionlint.with(
      {
        runtime_condition = function(params)
          local rootdir = u.root_pattern(".github")(params.bufname)
          return rootdir and strings.match(params.bufname, ".github/workflows/[^.]+.yaml")
        end
      }
    ),
    -- nix
    ls.builtins.diagnostics.deadnix,
    ls.builtins.diagnostics.statix,
    -- textlint
    ls.builtins.diagnostics.textlint.with(
      {
        method = ls.methods.DIAGNOSTICS_ON_SAVE,
        filetypes = {"markdown"},
        extra_args = {"--config", u.path.join(vim.fn.getcwd(), ".textlintrc.yaml")}
      }
    )
  }
}
