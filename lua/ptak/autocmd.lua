local api = vim.api

api.nvim_create_autocmd(
  "BufWritePre",
  { pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" }, command = 'EslintFixAll' }
)
