local global = vim.g
local function autocmd(name, cmds)
  local executable = ""

  for _, cmd in ipairs(cmds) do
    executable = executable .. vim.fn.printf("autocmd %s %s %s\n", cmd.event, cmd.target, cmd.action)
  end

  vim.cmd(vim.fn.printf([[
augroup %s
  autocmd!
  %s
augroup END
]], name, executable))
end

local formats = {
  "*.css",
  "*.go",
  "*.html",
  "*.js",
  "*.json",
  "*.lua",
  "*.nix",
  "*.pl",
  "*.pm",
  "*.scss",
  "*.t",
  "*.ts",
  "*.xml",
  "*.yaml",
  "cpanfile"
  -- "*.c",
  -- "*.cc",
  -- "*.cpp",
  -- "*.h",
  -- "*.hpp",
  -- "*.hh",
}

local commands = {}
for _, format in ipairs(formats) do
  commands[#commands + 1] = {event = "BufWritePre", target = format, action = "Neoformat"}
end

autocmd("neoformat-auto-format", commands)

local luafmt = vim.fn["neoformat#formatters#lua#luafmt"]()
luafmt.args = {"--stdin", "-i 2"}
global.neoformat_lua_luafmt = luafmt
