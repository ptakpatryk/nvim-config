local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
  return
end

local function is_whitespace(line)
  return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
  for _, entry in ipairs(tbl) do
    if not check(entry) then
      return false
    end
  end
  return true
end

neoclip.setup({
  history = 1000,
  enable_persistent_history = false,
  length_limit = 1048576,
  continuous_sync = false,
  --[[ db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3", ]]
  -- filters out white spaces
  filter = function(data)
    return not all(data.event.regcontents, is_whitespace)
  end,
  preview = true,
  prompt = nil,
  default_register = { '"', '+' },
  --[[ default_register_macros = 'q', ]]
  enable_macro_history = true,
  content_spec_column = false,
  on_paste = {
    set_reg = false,
  },
  on_replay = {
    set_reg = false,
  },
  keys = {
    telescope = {
      i = {
        select = '<CR>',
        paste = 'p',
        paste_behind = 'P',
        replay = '<c-q>', -- replay a macro
        delete = '<c-d>', -- delete an entry
        custom = {},
      },
      n = {
        select = '<CR>',
        paste = 'p',
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = 'P',
        replay = 'q',
        delete = 'd',
        custom = {},
      },
    },
    fzf = {
      select = 'default',
      paste = 'ctrl-p',
      paste_behind = 'ctrl-k',
      custom = {},
    },
  },
})
