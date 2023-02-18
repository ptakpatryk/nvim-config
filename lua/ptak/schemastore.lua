local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  return
end

require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
}
