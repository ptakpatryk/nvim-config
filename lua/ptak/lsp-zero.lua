local status_ok, lsp_zero = pcall(require, 'lsp-zero')
if not status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end


require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/ptak/snippets" } })

local kind_icons = {
  Text = "󰉿",
  Method = "m",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "󰆧",
  Class = "󰌗",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󱕵",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰇽",
  Struct = "",
  Event = "",
  Operator = "󰆖",
  TypeParameter = "󰊄",
}

lsp_zero.preset('recommended')

luasnip.filetype_extend("javascript", { "javascriptreact", "typescript" });
luasnip.filetype_extend("typescript", { "javascript" });
luasnip.filetype_extend("typescriptreact", { "typescript", "javascript" })
luasnip.filetype_extend("javascriptreact", { "javascript" })

require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = {
    --[[ 'rust_analyzer', ]]
    'eslint',
    'jsonls',
    'lua_ls',
    'ts_ls',
    'yamlls'
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
}

local navic = require("nvim-navic")

lsp_zero.configure('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  }
})

lsp_zero.configure('yamlls', {
  settings = {
    yaml = {
      keyOrdering = false
    },
  }
})

lsp_zero.on_attach(function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
  --[[ local opts = { buffer = bufnr, remap = false } ]]

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  if client.name == "eslint" then
    client.server_capabilities.documentFormattingProvider = true
    --[[ keymap("n", "<leader>ff", ":EslintFixAll<CR>:lua vim.lsp.buf.format()<CR>", opts) ]]
    keymap("n", "<leader>ff", ":EslintFixAll<CR>", opts)
    keymap("n", "<leader>fd", ":lua vim.lsp.buf.format()<CR>", opts)
    return
  elseif client.name == "l" then
  end

  lsp_zero.default_keymaps({ buffer = bufnr })
end)

local cmp_action = lsp_zero.cmp_action()

lsp_zero.setup()

local cmp_format = lsp_zero.cmp_format()

cmp.setup({
  --[[ formatting = cmp_format, ]]
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    -- Navigate between snippet placeholders
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = ''
})

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
  },
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    --[[ focusable = false, ]]
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
