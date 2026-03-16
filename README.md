# 🖵 My Nvim Config

<div align="center">
```
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
```

**A personal IDE config based on what I actually use**

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Git](https://img.shields.io/badge/Git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

</div>

---

## 📑 About

This repository contains my personal [Neovim](https://neovim.io/) configuration files written in [Lua](https://www.lua.org/). Built from scratch and evolved over time to fit my workflow.

### 💫 Features

#### 🖵 Interface
- 📦 **nvim-web-devicons**: file icons
- 📦 **nvim-tree**: floating file explorer with side toggle
- 📦 **bufferline**: tabs with numbers, diagnostics and icons
- 📦 **lualine**: statusline with venv detector
- 📦 **dashboard-nvim**: start screen with ASCII art
- 📦 **which-key**: keybinding popup helper
- 📦 **gitsigns**: git signs in the gutter
- 📦 **nvim-colorizer**: inline color preview
- 📦 **nvim-autopairs**: auto closing of brackets and quotes

#### 🤖 LSP & Autocomplete
- 📦 **nvim-lspconfig**: LSP with Pyright and Clangd
- 📦 **nvim-cmp**: autocompletion engine
- 📦 **LuaSnip**: snippets (pf, def, ifmain)
- 📦 **none-ls**: formatting with black and isort
- 📦 **supermaven**: AI-powered suggestions
- 📦 **inc-rename**: variable rename with live preview

#### 🐛 Debugging
- 📦 **nvim-dap**: debug adapter protocol
- 📦 **nvim-dap-ui**: visual debug interface
- 📦 **nvim-dap-virtual-text**: inline variable values during debug

#### 🔍 Search
- 📦 **telescope**: fuzzy finder for files, text and buffers

#### ✨ Extras
- 📦 **neocord**: Discord Rich Presence
- 📦 **nvim-treesitter**: syntax highlighting

---

## ⚙️ Custom Configs
- Theme system with persistence and transparency toggle
- Float/side toggle for NvimTree
- Terminal opening below when running Python
- Floating shortcut menu
- Shortcut to open Neovim config in Telescope
- Config reload shortcut
- Buffer navigation by number

---

## 📦 Dependencies

### Required
| Dependency | Install |
|------------|---------|
| [NeoVim 0.10+](https://neovim.io/) | Download from official site |
| [Git](https://git-scm.com/) | `sudo apt install git` |
| [Node.js + npm](https://nodejs.org/) | `sudo apt install nodejs npm` |
| [Python 3](https://www.python.org/) | `sudo apt install python3` |

### LSP
| Dependency | Install |
|------------|---------|
| [Pyright](https://github.com/microsoft/pyright) | `npm install -g pyright` |
| [Clangd](https://clangd.llvm.org/) | `sudo apt install clangd` |

### Formatting
| Dependency | Install |
|------------|---------|
| [Black](https://black.readthedocs.io/) | `pip install black --break-system-packages` |
| [isort](https://pycis.readthedocs.io/) | `pip install isort --break-system-packages` |

### Debug
| Dependency | Install |
|------------|---------|
| [debugpy](https://github.com/microsoft/debugpy) | `pip install debugpy --break-system-packages` |

### Fonts (recommended)
| Dependency | Description |
|------------|-------------|
| [Nerd Font](https://www.nerdfonts.com/) | Required for icons to render correctly |

### Optional
| Dependency | Description |
|------------|-------------|
| [Discord](https://discord.com/) | Required for Rich Presence |
| [g++](https://gcc.gnu.org/) | To run C++ files (`sudo apt install g++`) |
| [Java JDK](https://openjdk.org/) | To run Java files (`sudo apt install default-jdk`) |
| [Flet](https://flet.dev/) | To run Flet projects (`pip install flet`) |

---

## 🛠️ Config Structure
```
├── init.lua
├── lazy-lock.json
└── lua
    ├── configs
    │   ├── autocmds.lua
    │   ├── commands.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins
        ├── cmp.lua
        ├── configs
        │   ├── bufferline.lua
        │   ├── colorizer.lua
        │   ├── dashboard.lua
        │   ├── lualine.lua
        │   ├── nvimtree.lua
        │   ├── onedark.lua
        │   ├── supermaven.lua
        │   └── whichkey.lua
        ├── dap.lua
        ├── init.lua
        ├── lsp.lua
        ├── telescope.lua
        ├── themes.lua
        ├── treesitter.lua
        └── ui.lua
```

---

## ⌨️ Keymaps

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>ff` | Normal | Find files (Telescope) |
| `<leader>fg` | Normal | Live grep in project |
| `<leader>fb` | Normal | Find open buffers |
| `<leader>fh` | Normal | Search help tags |
| `<leader>fr` | Normal | Recent files |
| `<leader>fc` | Normal | Search NeoVim config |
| `<leader>w` | Normal | Save file |
| `<leader>q` | Normal | Quit |
| `<leader>x` | Normal | Save and quit |
| `<leader>n` | Normal | Create new file |
| `<leader>m` | Normal | Rename current file |
| `<leader>rn` | Normal | Rename variable (LSP) |
| `<leader>fmt` | Normal | Format file |
| `<leader>rt` | Normal | Run Python |
| `<leader>rc` | Normal | Run C++ |
| `<leader>rj` | Normal | Run Java |
| `<leader>rf` | Normal | Run Flet |
| `<leader>rv` | Normal | Reload NeoVim config |
| `<leader>tt` | Normal | Open terminal |
| `<leader>dt` | Normal | Toggle Breakpoint |
| `<leader>dc` | Normal | Continue debug |
| `<leader>du` | Normal | Toggle debug UI |
| `<leader>dx` | Normal | Stop debug |
| `<leader>db` | Normal | Toggle Breakpoint |
| `<leader>gp` | Normal | Preview Git Hunk |
| `<leader>gb` | Normal | Git Blame line |
| `<leader>tb` | Normal | Toggle transparency |
| `<leader>tf` | Normal | Toggle NvimTree float |
| `<leader>ts` | Normal | Toggle NvimTree side |
| `<leader>mm` | Normal | Comment line |
| `<leader>?` | Normal | Shortcut menu |
| `<C-a>` | Normal | Toggle NvimTree |
| `<C-h>` | Normal | Window left |
| `<C-j>` | Normal | Window below |
| `<C-k>` | Normal | Window above |
| `<C-l>` | Normal | Window right |
| `<C-d>` | Normal | Duplicate line |
| `<Tab>` | Normal | Indent line |
| `<S-Tab>` | Normal | Unindent line |
| `<Tab>` | Visual | Indent block |
| `<S-Tab>` | Visual | Unindent block |
| `<Alt-j>` | Normal/Visual | Move line(s) down |
| `<Alt-k>` | Normal/Visual | Move line(s) up |
| `<F5>` | Normal | Debug: Continue |
| `<F9>` | Normal | Debug: Toggle Breakpoint |
| `<F10>` | Normal | Debug: Step Over |
| `<F11>` | Normal | Debug: Step Into |
| `<F12>` | Normal | Debug: Step Out |
| `:Theme` | Command | Change theme |
| `:Menu` | Command | Shortcut menu |
| `:Lazy` | Command | Manage plugins |
| `:TSUpdate` | Command | Update Treesitter parsers |

---

## 📝 Important Notes

⚠️ **Warning**: This configuration may be unstable and might not work correctly on all systems. Basic knowledge of Neovim is recommended. Use with caution and always backup your config files.

---

## 👨‍💻 Author

Developed with ❤️ by [TheRake]

- GitHub: [@TheRake066](https://github.com/TheRake066)
- Email: sidneyvr01@gmail.com

---

## 🙏 Acknowledgements

- [@nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [@nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [@nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [@folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- [@neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

<div align="center">

**⭐ If this project was useful to you, consider giving it a star!**

</div>
