return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("configs.lazygit").setup()
    end,
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },


  {
    "echasnovski/mini.icons",
    lazy = false,
    config = function()
      require("mini.icons").setup({
        -- Configuration options
        style = "glyph", -- Use actual icon glyphs (requires Nerd Font)
        -- Can also be "ascii" for ASCII fallbacks
        
        -- Customize specific categories if needed
        -- file = { ... },
        -- filetype = { ... },
        -- directory = { ... },
        -- lsp = { ... },
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("configs.telescope")
    end,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    version = "*",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("frecency")
    end,
    keys = {
      {
        "<leader>fr", 
        "<cmd>Telescope frecency<cr>", 
        desc = "Find files by frecency (frequency + recency)"
      },
      {
        "<leader>fw", 
        "<cmd>Telescope frecency workspace=CWD<cr>", 
        desc = "Find files by frecency in current workspace"
      },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Enable Copilot for all filetypes by default
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
      
      -- Copilot keymaps
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("")', {
        expr = true,
        desc = "Accept Copilot suggestion",
        replace_keycodes = false,
        silent = true
      })
      
      -- Alternative Tab mapping for Copilot
      vim.keymap.set('i', '<Tab>', function()
        if vim.fn['copilot#GetDisplayedSuggestion']().text ~= '' then
          return vim.fn['copilot#Accept']('')
        else
          return '<Tab>'
        end
      end, {
        expr = true,
        desc = "Accept Copilot suggestion or insert tab",
        replace_keycodes = false,
        silent = true
      })
      
      -- Optional: Set Node.js path if needed
      -- vim.g.copilot_node_command = "/path/to/node"
    end,
    build = ":Copilot setup", -- Run setup after installation
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T"
        },
        timeout = 5000,
        top_down = true
      })
      vim.notify = require("notify")
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", 
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- Use a classic cmdline for search (/)
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          opts = {},
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
          },
        },
        messages = {
          enabled = true,
          view = "notify", -- default view for messages
          -- View used for vim.notify
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
        popupmenu = {
          enabled = true,
          backend = "nui", -- backend to use to show regular cmdline completions
        },
        -- Default options for require('noice').redirect
        redirect = {
          view = "popup",
          filter = { event = "msg_show" },
        },
        -- Hide written messages
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    dependencies = { 
      "nvim-treesitter/nvim-treesitter", 
      "echasnovski/mini.icons" -- or "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("render-markdown").setup({
        -- Characters that will replace the ones above when anti_conceal is enabled
        anti_conceal = {
          enabled = true,
        },
        -- Logging level of plugin
        log_level = 'error',
        -- Filetypes this plugin will run on
        file_types = { 'markdown', 'Avante' },
        -- Out of the box language support
        code = {
          -- Turn on / off code block & inline code rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Determines how code blocks & inline code are rendered:
          --  none:     disables all rendering
          --  normal:   adds highlight group to code blocks & inline code
          --  language: adds language icon to sign column if enabled and icon + name above code blocks
          --  full:     normal + language
          style = 'full',
          -- Amount of padding to add to the left of code blocks
          left_pad = 0,
          -- Amount of padding to add to the right of code blocks when width is 'block'
          right_pad = 0,
          -- Width of the code block background:
          --  block: width of the code block
          --  full:  full width of the window
          width = 'full',
          -- Determins how the top / bottom of code block are rendered:
          --  thick: use the same highlight as the code body
          --  thin:  when lines are empty overlay the above & below icons
          border = 'thin',
          -- Used above code blocks for thin border
          above = '▄',
          -- Used below code blocks for thin border
          below = '▀',
          -- Highlight for code blocks & inline code
          highlight = 'RenderMarkdownCode',
        },
        -- Heading configuration
        heading = {
          -- Turn on / off heading icon & background rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Replaces '#+' of headings
          icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
          -- Added to sign column if enabled and above icons are enabled
          signs = { '󰫎 ' },
          -- Width of the heading background:
          --  block: width of the heading text
          --  full:  full width of the window
          width = 'full',
          -- The 'level' is used to index into the array using a cycle
          -- The result is left padded with spaces to hide any additional '#'
          left_pad = 0,
          -- The 'level' is used to index into the array using a cycle
          right_pad = 0,
          -- Minimum width to use for headings, padded with the above char
          min_width = 0,
          -- Determins if a border is added above and below headings
          border = false,
          -- Always use virtual text for headings, ignore conceal setting
          border_virtual = false,
          -- Highlight the start of the border using the foreground highlight
          border_prefix = false,
          -- Used above heading for border
          above = '▄',
          -- Used below heading for border
          below = '▀',
          -- Highlight for the heading icon and title
          backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
          },
          -- Highlight for the heading and sign icons
          foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
          },
        },
      })
    end,
  },

  -- Debug Adapter Protocol (DAP) plugins
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      -- Creates a beautiful debugger UI
      "rcarriga/nvim-dap-ui",
      -- Required dependency for nvim-dap-ui
      "nvim-neotest/nvim-nio",
      -- Installs the debug adapters for you
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      -- Add your own debuggers here
      "leoluz/nvim-dap-go",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Debug: See last session result." },
    },
    config = function()
      -- Setup mason-nvim-dap
      require("mason-nvim-dap").setup({
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,
        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},
        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          "delve", -- Go debugger
        },
      })
      
      -- Setup nvim-dap-go
      require('dap-go').setup()
      
      -- Load DAP configuration
      require("configs.dap")
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
