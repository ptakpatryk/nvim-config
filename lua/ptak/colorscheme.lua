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
  end
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
