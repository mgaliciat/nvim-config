require "nvchad.options"

-- add yours here!

local o = vim.o
o.scrolloff = 999  -- Keep cursor always centered
o.sidescrolloff = 8  -- Keep cursor centered horizontally with 8 columns left/right

-- Line numbers
o.number = true         -- Show line numbers
o.relativenumber = true -- Show relative line numbers

-- Fix for light themes and indent-blankline conflicts
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Define missing highlight group if it doesn't exist
    if vim.fn.hlexists("IblChar") == 0 then
      vim.api.nvim_set_hl(0, "IblChar", { fg = "#E5E5E5" })
    end
  end,
})

-- Neovide configuration
if vim.g.neovide then
  -- Font configuration
  vim.o.guifont = "LiterationMono Nerd Font:h13"
  
  -- No transparency (fully opaque)
  vim.g.neovide_opacity = 1.0
  vim.g.neovide_normal_opacity = 1.0
  
  -- Smooth cursor animations (professional mode)
  vim.g.neovide_cursor_vfx_mode = ""  -- No particle effects
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.05
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = false
end

-- JSON auto-format configuration
vim.api.nvim_create_autocmd("TextChanged", {
  pattern = "*.json",
  callback = function()
    -- Auto-format JSON buffer when content changes (like pasting)
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local content = table.concat(lines, "\n")
    
    -- Check if it looks like JSON (starts with { or [)
    if content:match("^%s*[{%[]") then
      -- Small delay to avoid formatting while still typing
      vim.defer_fn(function()
        require("conform").format({ buf = buf, async = true })
      end, 500)
    end
  end,
})

-- Alternative: Auto-format JSON on paste
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    -- Format JSON buffer after paste in normal mode
    if vim.bo.filetype == "json" then
      vim.defer_fn(function()
        require("conform").format({ async = true })
      end, 100)
    end
  end,
})

-- JSON Scratch Buffer Function
local function open_json_scratch()
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Open the buffer in a new window
  vim.api.nvim_command('vsplit')
  vim.api.nvim_win_set_buf(0, buf)
  
  -- Set buffer options for scratch buffer
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')     -- Not associated with a file
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')     -- Delete buffer when hidden
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)       -- No swap file
  vim.api.nvim_buf_set_option(buf, 'filetype', 'json')      -- Set as JSON
  
  -- Set buffer name
  vim.api.nvim_buf_set_name(buf, '[JSON Scratch]')
  
  -- Enter insert mode
  vim.api.nvim_command('startinsert')
end

-- Create the command
vim.api.nvim_create_user_command('JsonScratch', open_json_scratch, {})

-- Create key mapping
vim.keymap.set('n', '<leader>fjs', open_json_scratch, { desc = 'Open JSON scratch buffer' })

-- o.cursorlineopt ='both' -- to enable cursorline!
