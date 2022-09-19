local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = {
  "jsonls",
  "sumneko_lua",
  "eslint",
  "tsserver",
  "graphql",
  "html",
  "cssmodules_ls",
  "rust_analyzer",
  -- "efm",
  -- "grammarly",
  -- "rome",
  -- "stylelint_lsp"
}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("ptak.lsp.handlers").on_attach,
		capabilities = require("ptak.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "ptak.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end