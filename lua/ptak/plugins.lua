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
  use({ 'akinsho/bufferline.nvim' })
  use({ 'moll/vim-bbye' })
  use({ 'nvim-lualine/lualine.nvim' })
  use({ 'tpope/vim-surround' })
  use({ 'akinsho/toggleterm.nvim' })
  use({ 'simrat39/rust-tools.nvim' })
  -- use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
  -- use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
  use({ "goolord/alpha-nvim" })
  -- use("folke/which-key.nvim")

  -- Colorschemes
  use({ "folke/tokyonight.nvim" })
  use({ "lukas-reineke/indent-blankline.nvim"})

  -- cmp plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  -- LSP
  use({ "neovim/nvim-lspconfig" }) -- enable LSP
  use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = 'make' })
  use({ "AckslD/nvim-neoclip.lua", requires = { { 'nvim-telescope/telescope.nvim' } } })


  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter" })
  use({ "nvim-treesitter/nvim-treesitter-context" })
  use({ "windwp/nvim-ts-autotag" })

  -- Git
  use({ "lewis6991/gitsigns.nvim" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
