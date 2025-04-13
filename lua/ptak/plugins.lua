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
  'goolord/alpha-nvim',
  {
    'akinsho/bufferline.nvim',
    keys = {
      { "<leader>bP", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
      { "<leader>bc", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
      { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "[B",         "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
      { "]B",         "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
    },
  },
  'b0o/schemastore.nvim',   -- JSON SCHEMAS
  'nvim-pack/nvim-spectre', -- search/replace panel

  -- winbar
  { "SmiteshP/nvim-navic",                 dependencies = "neovim/nvim-lspconfig" },

  -- Colorschemes
  { 'folke/tokyonight.nvim' },
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
  { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate',                               dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' } },
  'windwp/nvim-ts-autotag',

  -- Git
  'lewis6991/gitsigns.nvim',

  -- harpoon
  'ThePrimeagen/harpoon',

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      -- Show prompts actions with telescope
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt({
            context = {
              "buffers",
            },
          })
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },
      -- Code related commands
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>",       desc = "CopilotChat - Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>",         desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>",        desc = "CopilotChat - Review code" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>",      desc = "CopilotChat - Refactor code" },
      { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
      -- Chat with Copilot in visual mode
      {
        "<leader>av",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ax",
        ":CopilotChatInline",
        mode = "x",
        desc = "CopilotChat - Inline chat",
      },
      -- Custom input for CopilotChat
      {
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      -- Generate commit message based on the git diff
      {
        "<leader>am",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      -- Quick chat with Copilot
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      -- Fix the issue with diagnostic
     { "<leader>af", "<cmd>CopilotChatFixError<cr>", desc = "CopilotChat - Fix Diagnostic" },
      -- Clear buffer and chat history
      { "<leader>al", "<cmd>CopilotChatReset<cr>",    desc = "CopilotChat - Clear buffer and chat history" },
      -- Toggle Copilot Chat Vsplit
      { "<leader>av", "<cmd>CopilotChatToggle<cr>",   desc = "CopilotChat - Toggle" },
      -- Copilot Chat Models
      { "<leader>a?", "<cmd>CopilotChatModels<cr>",   desc = "CopilotChat - Select Models" },
      -- Copilot Chat Agents
      { "<leader>aa", "<cmd>CopilotChatAgents<cr>",   desc = "CopilotChat - Select Agents" },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  -- linter
  --[[ 'mfussenegger/nvim-lint', ]]
  --[[ 'mhartington/formatter.nvim', ]]
  --[[ { ]]
  --[[   "nvimdev/guard.nvim", ]]
  --[[   -- Builtin configuration, optional ]]
  --[[   dependencies = { ]]
  --[[     "nvimdev/guard-collection", ]]
  --[[   }, ]]
  --[[ }, ]]

  --[[color highlight (hex values etc.)]]
  'brenoprata10/nvim-highlight-colors'
}

local opts = {}

require("lazy").setup(plugins, opts)
