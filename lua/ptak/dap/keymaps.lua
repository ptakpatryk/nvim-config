local file_types = {
  'typescriptreact',
  'typescript',
  'javascript',
}

local launch_types = {
  node = file_types
}

launch_types["node-terminal"] = file_types
launch_types["pwa-node"] = file_types
launch_types["pwa-chrome"] = file_types

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local continue = function()
  if vim.fn.filereadable('.vscode/launch.json') then
    require("dap.ext.vscode").load_launchjs(nil, launch_types)
  end
  require('dap').continue()
end

keymap("n", "<F5>", continue, opts)
keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
keymap("n", "<leader>do", "<Cmd>lua require'dapui'.open()<CR>", opts)
keymap("n", "<leader>dc", "<Cmd>lua require'dapui'.close()<CR>", opts)
