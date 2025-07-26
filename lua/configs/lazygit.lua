-- Lazygit configuration for better diff highlighting
local M = {}

M.setup = function()
  -- Configure lazygit with better diff options
  vim.g.lazygit_floating_window_winblend = 0
  vim.g.lazygit_floating_window_scaling_factor = 0.9
  vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'}
  vim.g.lazygit_floating_window_use_plenary = 0
end

return M