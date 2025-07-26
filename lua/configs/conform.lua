-- Function to detect Go module path dynamically
local function get_go_local_path()
  -- Try to read go.mod file to get module path
  local go_mod = vim.fn.findfile("go.mod", ".;")
  if go_mod ~= "" then
    local file = io.open(go_mod, "r")
    if file then
      local first_line = file:read("*line")
      file:close()
      if first_line then
        local module_path = first_line:match("module%s+(.+)")
        if module_path then
          return module_path
        end
      end
    end
  end
  
  -- Fallback to common patterns
  local cwd = vim.fn.getcwd()
  if cwd:match("bitbucket%.org/rappinc") then
    return "bitbucket.org/rappinc"
  elseif cwd:match("github%.com/rappinc") then
    return "github.com/rappinc"
  elseif cwd:match("gitlab%.com/rappinc") then
    return "gitlab.com/rappinc"
  end
  
  -- Default fallback
  return "bitbucket.org/rappinc"
end

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gci", "gofumpt" },
    json = { "jq" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    gci = {
      command = "gci",
      args = function()
        local local_path = get_go_local_path()
        return {
          "write",
          "--skip-generated",
          "-s", "standard",
          "-s", "default", 
          "-s", "prefix(" .. local_path .. ")",
          "$FILENAME"
        }
      end,
      stdin = false,
    },
    gofumpt = {
      command = "gofumpt",
      args = {},
      stdin = true,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
