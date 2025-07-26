# NvChad Neovim Configuration

A comprehensive Neovim configuration built on top of [NvChad](https://github.com/NvChad/NvChad) with additional plugins and customizations for enhanced development experience.

## 🚀 Features

- **Base Framework**: Built on NvChad v2.5 for solid foundation
- **Theme**: Ashes colorscheme with customizable options
- **AI-Powered**: GitHub Copilot integration with smart keybindings
- **Enhanced UI**: Noice.nvim for better command line and notifications
- **Debugging**: Full DAP (Debug Adapter Protocol) support with UI
- **Git Integration**: LazyGit for seamless git operations
- **Smart File Finding**: Telescope with frecency-based file discovery
- **Code Formatting**: Conform.nvim for consistent code formatting
- **Markdown Support**: Beautiful markdown rendering
- **Go Development**: Specialized Go debugging and LSP configuration

## 📦 Key Plugins

### Core Extensions
- **Conform.nvim** - Code formatting on save
- **LazyGit** - Git interface integration
- **Telescope + Frecency** - Smart file finding
- **GitHub Copilot** - AI code completion
- **Mini.icons** - Modern icon support

### UI Enhancements
- **Noice.nvim** - Enhanced command line experience
- **nvim-notify** - Beautiful notifications
- **Render-markdown** - Rich markdown preview

### Development Tools
- **nvim-dap** - Debug Adapter Protocol support
- **nvim-dap-ui** - Debugging interface
- **mason-nvim-dap** - Debug adapter management
- **nvim-dap-go** - Go-specific debugging

## ⚡ Key Bindings

### Copilot
- `<Tab>` - Accept Copilot suggestion or insert tab
- `<C-J>` - Accept Copilot suggestion (alternative)

### LazyGit
- `<leader>lg` - Open LazyGit interface

### Telescope Frecency
- `<leader>fr` - Find files by frequency and recency
- `<leader>fw` - Find files in current workspace

### Debugging (DAP)
- `<F5>` - Start/Continue debugging
- `<F10>` - Step over
- `<F11>` - Step into
- `<F12>` - Step out
- `<leader>db` - Toggle breakpoint
- `<leader>du` - Toggle debug UI

## 🛠 Installation

1. **Prerequisites**:
   - Neovim 0.9+
   - Git
   - A Nerd Font for icons
   - Node.js (for Copilot)

2. **Setup**:
   ```bash
   # Backup existing config
   mv ~/.config/nvim ~/.config/nvim.backup
   
   # Clone this configuration
   git clone <your-repo-url> ~/.config/nvim
   
   # Remove .git folder (or fork the repo)
   rm -rf ~/.config/nvim/.git
   
   # Start Neovim - plugins will auto-install
   nvim
   ```

3. **Post-installation**:
   - Run `:Copilot setup` for GitHub Copilot
   - Configure LSP servers as needed
   - Install debug adapters via Mason

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── chadrc.lua          # NvChad configuration
│   ├── options.lua         # Vim options
│   ├── mappings.lua        # Key mappings
│   ├── configs/            # Plugin configurations
│   │   ├── conform.lua     # Formatting config
│   │   ├── dap.lua         # Debug config
│   │   ├── lspconfig.lua   # LSP configuration
│   │   ├── telescope.lua   # Telescope settings
│   │   └── lazygit.lua     # LazyGit setup
│   └── plugins/
│       └── init.lua        # Plugin specifications
├── ftplugin/
│   └── go.lua              # Go-specific settings
└── lazy-lock.json          # Plugin version lock
```

## 🎨 Customization

### Changing Theme
Edit `lua/chadrc.lua`:
```lua
M.base46 = {
  theme = "your-theme-name", -- Change from "ashes"
}
```

### Adding Plugins
Add new plugins in `lua/plugins/init.lua`:
```lua
{
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

### Custom Keybindings
Modify `lua/mappings.lua` for additional key mappings.

## 🔧 Language Support

Currently optimized for:
- **Go** - Full debugging and LSP support
- **Lua** - Native Neovim configuration
- **Web Technologies** - HTML, CSS, JavaScript
- **General** - Universal formatting and LSP via Mason

## 📝 Notes

- This configuration uses NvChad as a plugin rather than a fork
- The main NvChad repository provides the core functionality
- Custom configurations are layered on top for enhanced features
- All plugins are managed by Lazy.nvim for optimal startup performance

## 🙏 Credits

- [NvChad](https://github.com/NvChad/NvChad) - Base configuration framework
- [LazyVim](https://github.com/LazyVim/starter) - Inspiration for starter structure
- All plugin authors for their amazing work