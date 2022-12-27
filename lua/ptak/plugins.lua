local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use({ 'wbthomason/packer.nvim' }) -- Have packer manage itself
  use({ 'nvim-lua/plenary.nvim' }) -- Useful lua functions used by lots of plugins
  use({ 'RRethy/vim-illuminate' }) -- illuminates other keywords when cursor is hovering over
  use({ 'windwp/nvim-autopairs' }) -- Autopairs, integrates with both cmp and treesitter
  use({ 'numToStr/Comment.nvim' })
  use({ 'JoosepAlviste/nvim-ts-context-commentstring' })
  use({ 'kyazdani42/nvim-web-devicons' })
  use({ 'kyazdani42/nvim-tree.lua' })
  use({ 'mbbill/undotree' }) -- visualizes the undo history and makes it easy to browse and switch between different undo branches
  use({ 'moll/vim-bbye' })
  use({ 'nvim-lualine/lualine.nvim' })
  use({ 'tpope/vim-surround' })
  use({ 'simrat39/rust-tools.nvim' })
  use({ 'goolord/alpha-nvim' })
  use({ 'akinsho/bufferline.nvim' })
  use({ 'styled-components/vim-styled-components' })

  -- winbar
  use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" })

  -- Colorschemes
  use({ "folke/tokyonight.nvim" })
  use({ "lukas-reineke/indent-blankline.nvim" })

  -- Debugger
  use({ "mfussenegger/nvim-dap" })
  use({ "rcarriga/nvim-dap-ui" })
  use({ "theHamsta/nvim-dap-virtual-text" })
  use({ "nvim-telescope/telescope-dap.nvim" })
  use({ "mxsdev/nvim-dap-vscode-js" })
  use({ "HUAHUAI23/telescope-dapzzzz" })
  -- Built-in support for many task frameworks (make, npm, cargo, .vscode/tasks.json, etc)
  use({ "stevearc/overseer.nvim" })


  -- ZERO LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
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
  }
  -- LSP Loading status
  --[[ use({ 'arkav/lualine-lsp-progress'}) ]]
  use({ "j-hui/fidget.nvim" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = 'make' })
  use({ "AckslD/nvim-neoclip.lua", requires = { { 'nvim-telescope/telescope.nvim' } } })


  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter" })
  use({ "windwp/nvim-ts-autotag" })

  -- Git
  use({ "lewis6991/gitsigns.nvim" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
