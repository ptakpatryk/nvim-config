local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "ptak.lsp.configs"
require("ptak.lsp.handlers").setup()
require "ptak.lsp.null-ls"

