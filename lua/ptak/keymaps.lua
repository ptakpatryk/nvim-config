local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ INSERT MODE ]]
-- cancel on ctrl + c
keymap("i", "<C+c>", "<Esc>", opts)

--[[ NORMAL MODE ]]
-- :Nvim-tree shortcut
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Better window navigation
--[[ keymap("n", "<C-h>", "<C-w>h", opts) ]]
--[[ keymap("n", "<C-j>", "<C-w>j", opts) ]]
--[[ keymap("n", "<C-k>", "<C-w>k", opts) ]]
--[[ keymap("n", "<C-l>", "<C-w>l", opts) ]]

-- Resize with arrows (doesnt work on mac tho...)
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
--[[ keymap("n", "<S-l>", ":bnext<CR>", opts) ]]
--[[ keymap("n", "<S-h>", ":bprevious<CR>", opts) ]]
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":Bdelete! <CR>", opts)
keymap("n", "<leader>w", ":Bdelete! <CR>", opts)

--[[ VISUAL MODE ]]
-- Stay in visual when indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", opts) -- Alt + j
keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", opts) -- Alt + k
keymap("v", "p", '"_dP', opts)

-- Telescope
keymap("n", "<leader>p", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>F", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)
keymap("i", "<C-q>", "actions.smart_add_to_qflist + actions.open_qflist", opts)
keymap("n", "<leader>n", ":Telescope neoclip unnamed extra=plus<CR>", opts)

keymap("n", "<leader>gb", ":Gitsign blame_line <CR>", opts)

-- Undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", opts)

-- Format
keymap("n", "<leader>ff", ":lua vim.lsp.buf.format()<CR>", opts) -- sometimes gets overwritten with :EslintFixAll so there's `fd` below
keymap("n", "<leader>fd", ":lua vim.lsp.buf.format()<CR>", opts)

-- Toggle highlight
keymap("n", "<leader>h", ":set invhlsearch<CR>", opts)

-- Change next occurence
keymap("n", "<leader>x", ":let @/=expand('<cword>')<cr>cgn", opts)
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)
keymap("i", "<C-L>", "<Plug>(copilot-accept-word)", opts)
keymap("i", "<M-C-L>", "<Plug>(copilot-accept-line)", opts)
keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {expr = true, silent = true})

keymap("n", "<leader>r", ":lua require('telescope').extensions.refactoring.refactors()<CR>", opts)

