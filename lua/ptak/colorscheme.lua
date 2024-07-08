local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

tokyonight.setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
  on_colors = function(colors)
    colors.bg_statusline = nil -- transparent background for lualine seciton c
  end,
  on_highlights = function(hl, c)
    hl.Include = {
      fg = c.purple
    }
    hl.Label = {
      fg = c.red
    }
    hl['@tag.tsx'] = {
      fg = c.blue1
    }
    hl['@tag.delimiter.tsx'] = {
      fg = c.dark3
    }
    hl['Function'] = {
      fg = c.blue
    }
    hl['CmpItemKindVariable'] = {
      fg = c.blue0,
    }
    hl['@type.qualifier'] = {
      fg = "#ffe51f"
    }
    hl['LspKindFile'] = {
      fg = c.magenta2
    }
    hl['@lsp.type.namespace'] = {
      fg = c.red
    }
    --[[ Keyword change ]]
    --[[ hl['@keyword'] = { ]]
    --[[   fg = "#7197e0", ]]
    --[[ } ]]
    --[[ Keyword default ]]
    --[[ hl["@type.qualifier"] = { ]]
    --[[   fg = c.purple ]]
    --[[ } ]]
    --[[ hl["@keyword.coroutine"] = { ]]
    --[[   fg = c.purple ]]
    --[[ } ]]
    --[[ hl["@keyword.return"] = { ]]
    --[[   fg = c.purple ]]
    --[[ } ]]
    --[[ hl["@lsp.type.keyword"] = { ]]
    --[[   fg = c.purple ]]
    --[[ } ]]
    --[[ hl["@lsp.typemod.keyword.injected"] = { ]]
    --[[   fg = c.purple ]]
    --[[ } ]]
  end,
})

vim.cmd [[
try
  colorscheme tokyonight-night
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=transparent
endtry
]]

--[[ vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) ]]
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
