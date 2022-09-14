local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " " 

-- cancel on ctrl + c
keymap("i", "<C+c>", "<Esc>", opts)

-- :Lexplore tree shortcut
keymap("n", "<leader>e", ":Lex 20<cr>", opts)

-- Resize with arrows (doesnt work on mac tho...)
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- VISUAL --
-- Stay in visual when indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- Alt + j
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- Alt + k
keymap("v", "p", '"_dP', opts)
