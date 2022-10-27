--[[ local api = vim.api ]]

--[[ vim.api.nvim_create_autocmd( ]]
--[[   "BufWritePre", ]]
--[[   { pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" }, command = 'EslintFixAll' } ]]
--[[ ) ]]

--[[ vim.api.nvim_create_autocmd("BufWritePre", { callback = function() vim.lsp.buf.format() end }) ]]
