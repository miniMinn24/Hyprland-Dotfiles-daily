-- ~/.config/nvim/lua/custom/configs/omnisharp.lua

return {
  cmd = { "omnisharp" }, -- this assumes it's installed (via Mason or system path)
  filetypes = { "cs", "vb" },
  root_dir = require("lspconfig").util.root_pattern("*.sln", "*.csproj", ".git"),
  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = false,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  sdk_include_prereleases = true,
  analyze_open_documents_only = false,
}

