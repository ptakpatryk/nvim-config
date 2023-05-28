require('spectre').setup()


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', opts) -- Open Spectre
keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts) -- Search current word
keymap('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', opts) -- Search current word (vmode)
keymap('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', opts) --<cmd>lua require("spectre").open_file_search({select_word=true})<CR> 
