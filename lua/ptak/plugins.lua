local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--[[ FIX ]]

local plugins = {
  'nvim-lua/plenary.nvim', -- Useful lua functions used by lots of plugins
  'RRethy/vim-illuminate', -- illuminates other keywords when cursor is hovering over
  'windwp/nvim-autopairs', -- Autopairs, integrates with both cmp and treesitter
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'mbbill/undotree', -- visualizes the undo history and makes it easy to browse and switch between different undo branches
  'moll/vim-bbye',
  'nvim-lualine/lualine.nvim',
  'tpope/vim-surround',
  'simrat39/rust-tools.nvim',
  'goolord/alpha-nvim',
  'akinsho/bufferline.nvim',
  'styled-components/vim-styled-components',
  'b0o/schemastore.nvim',   -- JSON SCHEMAS
  'nvim-pack/nvim-spectre', -- search/replace panel

  -- winbar
  { "SmiteshP/nvim-navic",                 dependencies = "neovim/nvim-lspconfig" },

  -- Colorschemes
  { 'folke/tokyonight.nvim',               commit = "e1e8ff2c8ff2bdc90ce35697291a5917adc8db5c" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                                       opts = {} },

  -- Debugger
  { "rcarriga/nvim-dap-ui",                dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',
  'mxsdev/nvim-dap-vscode-js',
  'HUAHUAI23/telescope-dapzzzz',
  -- Built-in support for many task frameworks (make, npm, cargo, .vscode/tasks.json, etc)
  'stevearc/overseer.nvim',


  -- ZERO LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  -- LSP Loading status
  { 'j-hui/fidget.nvim',     tag = 'legacy' }, -- spinner for lsp progress

  -- Folding
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

  -- Telescope
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'AckslD/nvim-neoclip.lua',                  dependencies = { 'nvim-telescope/telescope.nvim' } },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate',                               dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', commit = "bb020f6" }, commit = "2c1eb02e92734406866b993bd87111891830455b" },
  'windwp/nvim-ts-autotag',

  -- Git
  'lewis6991/gitsigns.nvim',

  -- IMPORT COST
  { 'barrett-ruth/import-cost.nvim', build = 'sh install.sh yarn' },

  -- harpoon
  'ThePrimeagen/harpoon'
}

local opts = {}

require("lazy").setup(plugins, opts)
