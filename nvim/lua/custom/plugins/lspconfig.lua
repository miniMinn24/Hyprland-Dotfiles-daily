-- ~/.config/nvim/lua/custom/plugins/lspconfig.lua

local lspconfig = require "lspconfig"

local servers = { "omnisharp" }

for _, lsp in ipairs(servers) do
  local opts = {}

  local has_custom_opts, server_custom_opts = pcall(require, "custom.configs." .. lsp)
  if has_custom_opts then
    opts = server_custom_opts
  end

  lspconfig[lsp].setup(opts)
end

