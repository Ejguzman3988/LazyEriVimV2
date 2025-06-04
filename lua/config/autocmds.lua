-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Get all available colorschemes
local schemes = vim.fn.getcompletion("", "color")

-- Find the index of the current colorscheme
local function find_current_index()
  local current = vim.g.colors_name
  for i, name in ipairs(schemes) do
    if name == current then
      return i
    end
  end
  return 0 -- fallback if not found
end

-- Create the command to go to the next colorscheme
vim.api.nvim_create_user_command("NextColorscheme", function()
  local index = find_current_index()
  local next_index = (index % #schemes) + 1
  local next_scheme = schemes[next_index]
  vim.cmd.colorscheme(next_scheme)
  print("Switched to colorscheme: " .. next_scheme)
end, {})

-- Also define a command to just show current scheme
vim.api.nvim_create_user_command("CurrentColorscheme", function()
  print("Current colorscheme: " .. (vim.g.colors_name or "none"))
end, {})
