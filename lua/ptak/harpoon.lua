require("harpoon").setup({
  -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
  save_on_toggle = false,

  -- saves the harpoon file upon every change. disabling is unrecommended.
  save_on_change = true,

  -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
  enter_on_sendcmd = false,

  -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
  tmux_autoclose_windows = false,

  -- filetypes that you want to prevent from adding to the harpoon list menu.
  excluded_filetypes = { "harpoon" },

  -- set marks specific to each git branch inside git repository
  mark_branch = false,

  -- enable tabline with harpoon marks
  tabline = false,
  tabline_prefix = "   ",
  tabline_suffix = "   ",
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>a",  ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<C-e>",  ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "hm",  ":Telescope harpoon marks<CR>", opts)
keymap("n", "h1",  ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "h2",  ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "h3",  ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "h4",  ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
keymap("n", "h5",  ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
