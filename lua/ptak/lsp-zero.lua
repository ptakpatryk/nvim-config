local status_ok, lsp = pcall(require, 'lsp-zero')
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

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}


lsp.preset('recommended')

lsp.ensure_installed({
  'eslint',
  'tsserver',
  'sumneko_lua',
  'rust_analyzer'
})

lsp.nvim_workspace()

luasnip.filetype_extend("javascript", { "javascriptreact" });
luasnip.filetype_extend("javascript", { "typescript" });
luasnip.filetype_extend("typescript", { "javascript" });

lsp.on_attach(function(client, bufnr)
  --[[ local opts = { buffer = bufnr, remap = false } ]]
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  if client.name == "eslint" then
    keymap("n", "<leader>ff", ":EslintFixAll<CR>", opts)
    return
  end

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  keymap("n", "<leader>vd", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_next, opts)
  keymap("n", "]d", vim.diagnostic.goto_prev, opts)
  keymap("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>vrr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  --[[ ['<C-Space>'] = cmp.mapping.complete(), ]]
  ['<C-e>'] = cmp.mapping.abort(),
})

lsp.setup_nvim_cmp({
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
  mapping = cmp_mappings,
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  --[[ window = { ]]
  --[[   documentation = cmp.config.window.bordered(), ]]
  --[[   completion = cmp.config.window.bordered(), ]]
  --[[   winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None', ]]
  --[[ } ]]
})


lsp.setup()

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
  },
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
