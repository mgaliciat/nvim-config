# Neovim Configuration - Commands and Shortcuts

This document provides a comprehensive list of all configured shortcuts and commands in this Neovim configuration. The setup is based on NvChad with custom additions.

## Table of Contents

1. [General Navigation](#general-navigation)
2. [Insert Mode Navigation](#insert-mode-navigation)
3. [Window Management](#window-management)
4. [File Operations](#file-operations)
5. [Buffer Management](#buffer-management)
6. [Tab Management](#tab-management)
7. [Terminal Management](#terminal-management)
8. [File Explorer (NvimTree)](#file-explorer-nvimtree)
9. [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
10. [LSP (Language Server Protocol)](#lsp-language-server-protocol)
11. [Debugging (DAP)](#debugging-dap)
12. [Git Integration](#git-integration)
13. [Code Editing](#code-editing)
14. [Comments](#comments)
15. [AI Assistance (Copilot)](#ai-assistance-copilot)
16. [Plugin-Specific Commands](#plugin-specific-commands)
17. [Custom Utilities](#custom-utilities)

## General Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `;` | Normal | `:` | Enter command mode |
| `jk` | Insert | `<ESC>` | Exit insert mode |
| `<Esc>` | Normal | Clear highlights | Clear search highlights |
| `<C-s>` | Normal/Insert/Visual | `:w` | Save file |
| `<C-c>` | Normal | Copy file | Copy entire file to clipboard |

## Insert Mode Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-b>` | Insert | Move to beginning | Move to beginning of line |
| `<C-e>` | Insert | Move to end | Move to end of line |
| `<C-h>` | Insert | Move left | Move cursor left |
| `<C-l>` | Insert | Move right | Move cursor right |
| `<C-j>` | Insert | Move down | Move cursor down |
| `<C-k>` | Insert | Move up | Move cursor up |

## Window Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-h>` | Normal | Switch left | Switch to left window |
| `<C-l>` | Normal | Switch right | Switch to right window |
| `<C-j>` | Normal | Switch down | Switch to window below |
| `<C-k>` | Normal | Switch up | Switch to window above |
| `ss` | Normal | `:split` | Horizontal split |
| `sv` | Normal | `:vsplit` | Vertical split |
| `sh` | Normal | Move left | Move to left window |
| `sk` | Normal | Move up | Move to upper window |
| `sj` | Normal | Move down | Move to lower window |
| `sl` | Normal | Move right | Move to right window |

## File Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>fm` | Normal | Format | Format file using conform.nvim |
| `<leader>n` | Normal | Toggle numbers | Toggle line numbers |
| `<leader>rn` | Normal | Toggle relative | Toggle relative line numbers |

## Buffer Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>b` | Normal | New buffer | Create new buffer |
| `<leader>x` | Normal | Close buffer | Close current buffer |
| `<Tab>` | Normal | Next buffer | Go to next buffer |
| `<S-Tab>` | Normal | Previous buffer | Go to previous buffer |

## Tab Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `te` | Normal | `:tabedit` | Open new tab |
| `<Tab>` | Normal | Next tab | Go to next tab (custom override) |
| `<S-Tab>` | Normal | Previous tab | Go to previous tab (custom override) |

## Terminal Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-x>` | Terminal | Exit terminal | Exit terminal mode |
| `<leader>h` | Normal | Horizontal term | New horizontal terminal |
| `<leader>v` | Normal | Vertical term | New vertical terminal |
| `<Alt-v>` | Normal | Toggle vertical | Toggle vertical terminal |
| `<Alt-h>` | Normal | Toggle horizontal | Toggle horizontal terminal |
| `<Alt-i>` | Normal | Toggle floating | Toggle floating terminal |

## File Explorer (NvimTree)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-n>` | Normal | Toggle tree | Toggle NvimTree |
| `<leader>e` | Normal | Focus tree | Focus NvimTree |

## Telescope (Fuzzy Finder)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ff` | Normal | Find files | Find files |
| `<leader>fa` | Normal | Find all | Find all files (including hidden) |
| `<leader>fw` | Normal | Live grep | Search text in files |
| `<leader>fg` | Normal | Live grep | Live grep search in files (custom) |
| `<leader>fs` | Normal | Grep string | Search word under cursor |
| `<leader>fb` | Normal | Find buffers | Find open buffers |
| `<leader>fh` | Normal | Help tags | Search help tags |
| `<leader>fr` | Normal | Frecency | Find files by frecency (frequency + recency) |
| `<leader>fw` | Normal | Workspace frecency | Find files by frecency in current workspace |
| `<leader>ma` | Normal | Marks | Find marks |
| `<leader>fo` | Normal | Old files | Find recently opened files |
| `<leader>fz` | Normal | Fuzzy buffer | Fuzzy find in current buffer |
| `<leader>cm` | Normal | Git commits | Browse git commits |
| `<leader>gt` | Normal | Git status | Git status |
| `<leader>pt` | Normal | Pick terminal | Pick hidden terminal |
| `<leader>th` | Normal | Themes | Browse NvChad themes |

### Telescope Mappings (Inside Telescope)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-n>` | Insert | Next history | Cycle history next |
| `<C-p>` | Insert | Previous history | Cycle history previous |
| `<C-j>` | Insert | Move down | Move selection down |
| `<C-k>` | Insert | Move up | Move selection up |
| `<C-c>` | Insert | Close | Close telescope |
| `<Down>` | Insert | Move down | Move selection down |
| `<Up>` | Insert | Move up | Move selection up |
| `<CR>` | Insert | Select | Select default |
| `<C-x>` | Insert | Horizontal | Select horizontal split |
| `<C-v>` | Insert | Vertical | Select vertical split |
| `<C-t>` | Insert | Tab | Select in new tab |
| `<C-u>` | Insert | Scroll preview up | Preview scrolling up |
| `<C-d>` | Insert | Scroll preview down | Preview scrolling down |
| `<PageUp>` | Insert | Results up | Results scrolling up |
| `<PageDown>` | Insert | Results down | Results scrolling down |
| `<Tab>` | Insert | Toggle selection | Toggle selection + move worse |
| `<S-Tab>` | Insert | Toggle selection | Toggle selection + move better |
| `<C-q>` | Insert | Send to qflist | Send to quickfix list |
| `<M-q>` | Insert | Send selected | Send selected to quickfix list |
| `<C-l>` | Insert | Complete tag | Complete tag |
| `<C-_>` | Insert | Which key | Show which key help |
| `q` | Normal | Close | Close telescope |

## LSP (Language Server Protocol)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gD` | Normal | Declaration | Go to declaration |
| `gd` | Normal | Definition | Go to definition |
| `gi` | Normal | Implementation | Go to implementation |
| `gr` | Normal | References | Show references |
| `<leader>sh` | Normal | Signature help | Show signature help |
| `<leader>wa` | Normal | Add workspace | Add workspace folder |
| `<leader>wr` | Normal | Remove workspace | Remove workspace folder |
| `<leader>wl` | Normal | List workspace | List workspace folders |
| `<leader>D` | Normal | Type definition | Go to type definition |
| `<leader>ra` | Normal | Rename | Rename symbol |
| `<leader>ca` | Normal | Code actions | Show code actions |
| `<leader>ds` | Normal | Diagnostics | LSP diagnostic loclist |

## Debugging (DAP)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<F5>` | Normal | Continue | Start/Continue debugging |
| `<F10>` | Normal | Step over | Step over |
| `<F11>` | Normal | Step into | Step into |
| `<F12>` | Normal | Step out | Step out |
| `<leader>db` | Normal | Toggle breakpoint | Toggle breakpoint |
| `<leader>dB` | Normal | Conditional breakpoint | Set conditional breakpoint |
| `<leader>dp` | Normal | Log point | Set log point |
| `<leader>du` | Normal | Toggle UI | Toggle debug UI |
| `<leader>dr` | Normal | REPL | Open debug REPL |
| `<leader>dl` | Normal | Run last | Run last debug session |
| `<leader>dh` | Normal/Visual | Hover | Debug hover |
| `<leader>dp` | Normal/Visual | Preview | Debug preview |
| `<leader>df` | Normal | Frames | Show debug frames |
| `<leader>ds` | Normal | Scopes | Show debug scopes |

### DAP UI Mappings (Inside Debug UI)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | Normal | Expand | Expand item |
| `<2-LeftMouse>` | Normal | Expand | Expand item (double-click) |
| `o` | Normal | Open | Open item |
| `d` | Normal | Remove | Remove item |
| `e` | Normal | Edit | Edit item |
| `r` | Normal | REPL | Open REPL |
| `t` | Normal | Toggle | Toggle item |
| `q` | Normal | Close | Close floating window |
| `<Esc>` | Normal | Close | Close floating window |

## Git Integration

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>lg` | Normal | LazyGit | Open LazyGit interface |

## Code Editing

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>o` | Normal | Insert line below | Insert line below without entering insert mode |
| `<leader>O` | Normal | Insert line above | Insert line above without entering insert mode |

## Comments

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>/` | Normal | Toggle comment | Toggle line comment |
| `<leader>/` | Visual | Toggle comment | Toggle block comment |

## AI Assistance (Copilot)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Tab>` | Insert | Accept suggestion | Accept Copilot suggestion or insert tab |
| `<C-J>` | Insert | Accept suggestion | Accept Copilot suggestion |

## Plugin-Specific Commands

### NvCheatsheet
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ch` | Normal | Cheatsheet | Toggle NvCheatsheet |

### Which-Key
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>wK` | Normal | All keymaps | Show all keymaps |
| `<leader>wk` | Normal | Query keymap | Query specific keymap |

### Notifications (Noice/Notify)
- Enhanced command line interface with popup
- Better LSP progress notifications
- Improved message handling

### Render Markdown
- Real-time markdown rendering in buffers
- Enhanced code block visualization
- Improved heading display

## Custom Utilities

### Line Editing
- `<leader>o` - Insert new line below cursor without entering insert mode
- `<leader>O` - Insert new line above cursor without entering insert mode

### Tab Settings (Go files)
- 4-space indentation for Go files
- Spaces instead of tabs for Go files

## Plugin Commands

### LazyGit Commands
- `:LazyGit` - Open LazyGit interface

### Telescope Commands
- `:Telescope` - Open Telescope command palette
- `:Telescope frecency` - Open frecency picker
- `:Telescope frecency workspace=CWD` - Open workspace frecency picker

### DAP Commands
- `:DapToggleBreakpoint` - Toggle breakpoint
- `:DapContinue` - Continue debugging
- `:DapStepOver` - Step over
- `:DapStepInto` - Step into
- `:DapStepOut` - Step out

### Conform Commands
- `:ConformInfo` - Show conform information
- Format on save is enabled for supported file types

## Notes

1. **Leader Key**: The leader key is typically `<Space>` in NvChad
2. **Modes**: N = Normal, I = Insert, V = Visual, T = Terminal
3. **Buffer vs Tab**: This configuration uses both buffer and tab navigation - `<Tab>` switches tabs, while NvChad's tabufline shows buffers
4. **File Types**: Some mappings are specific to certain file types (e.g., Go-specific settings in `ftplugin/go.lua`)
5. **Plugin Dependencies**: Many features require specific plugins to be installed and configured
6. **Theme**: Current theme is set to "ashes" in the configuration

## Customization

To add your own mappings, edit the `lua/mappings.lua` file. Follow the existing pattern:

```lua
local map = vim.keymap.set
map("n", "<your_key>", "<your_command>", { desc = "Your description" })
```

For plugin-specific configurations, check the respective files in the `lua/configs/` directory.