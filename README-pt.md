# 🖵 Minha Config do Nvim

<div align="center">

```
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
```

**Uma IDE configurada por mim e baseada no que uso**

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Git](https://img.shields.io/badge/Git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

</div>

---

## 📑 Sobre

Esse repositório [Minha Config do Nvim](https://github.com/Orake/Minha-Config-do-Nvim) é um repositório para guardar meus arquivos de configuração do [Neovim](https://neovim.io/) e [Lua](https://www.lua.org/).

### 💫 Caracaterísticas

#### 🖵 Interface
- 📦 **nvim-web-devicons**: ícones de arquivos
- 📦 **nvim-tree**: explorador de arquivos flutuante com toggle de lado
- 📦 **bufferline**: abas com números, diagnósticos e ícones
- 📦 **lualine**: statusline com venv detector
- 📦 **dashboard-nvim**: tela inicial com ASCII art
- 📦 **which-key**: popup de atalhos
- 📦 **gitsigns**: sinais de git na lateral
- 📦 **nvim-colorizer**: preview de cores inline
- 📦 **nvim-autopairs**: fechamento automático de parênteses

#### 🖵 LSP & Autocomplete
- 📦 **nvim-lspconfig**: LSP com Pyright e Clangd
- 📦 **nvim-cmp**: autocomplete
- 📦 **LuaSnip**: snippets (pf, def, ifmain)
- 📦 **none-ls**: formatação com black e isort
- 📦 **supermaven**: sugestões de IA (so pra ajudar)
- 📦 **inc-rename**: rename de variáveis com preview

#### 🖵 Debugging
- 📦 **nvim-dap**: debugger
- 📦 **nvim-dap-ui**: interface visual do debug
- 📦 **nvim-dap-virtual-text**: valores inline durante debug

#### 🖵 Busca
- 📦 **telescope**: busca de arquivos, texto, buffers

- 📦 **neocord**: Discord Presence
- 📦 **nvim-treesitter**: syntax highlighting

## ⚙️Configs Customizadas
- Sistema de temas com persistência e toggle de transparência;
- Toggle float/lado do NvimTree;
- Terminal abrindo embaixo ao rodar Python;
- Menu de atalhos flutuante;
- Atalho pra config do Neovim no Telescope;
- Reload da config;
- Navegação entre buffers por número;

---

## 📦 Dependências

### Obrigatórias
| Dependência | Instalação |
|-------------|------------|
| [NeoVim 0.10+](https://neovim.io/) |
| [Git](https://git-scm.com/) |
| [Node.js + npm](https://nodejs.org/) |
| [Python 3](https://www.python.org/) |

### LSP
| Dependência | Instalação |
|-------------|------------|
| [Pyright](https://github.com/microsoft/pyright) | `npm install -g pyright` |
| [Clangd](https://clangd.llvm.org/) |

### Formatação
| Dependência | Instalação |
|-------------|------------|
| [Black](https://black.readthedocs.io/) | `pip install black --break-system-packages` |
| [isort](https://pycis.readthedocs.io/) | `pip install isort --break-system-packages` |

### Debug
| Dependência | Instalação |
|-------------|------------|
| [debugpy](https://github.com/microsoft/debugpy) | `pip install debugpy --break-system-packages` |

### Fontes (recomendado)
| Dependência | Descrição |
|-------------|-----------|
| [Nerd Font](https://www.nerdfonts.com/) | Necessária para ícones funcionarem corretamente |

### Opcional
| Dependência | Descrição |
|-------------|-----------|
| [Discord](https://discord.com/) |
| [g++](https://gcc.gnu.org/) |
| [Java JDK](https://openjdk.org/) |
| [Flet](https://flet.dev/) | se você quiser rodar projetos em Flet |

---
### 🛠️Estrutura da Config
```
├── init.lua
├── lazy-lock.json
└── lua
    ├── configs
    │   ├── autocmds.lua
    │   ├── commands.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins
        ├── cmp.lua
        ├── configs
        │   ├── bufferline.lua
        │   ├── colorizer.lua
        │   ├── dashboard.lua
        │   ├── lualine.lua
        │   ├── nvimtree.lua
        │   ├── onedark.lua
        │   ├── supermaven.lua
        │   └── whichkey.lua
        ├── dap.lua
        ├── init.lua
        ├── lsp.lua
        ├── telescope.lua
        ├── themes.lua
        ├── treesitter.lua
        └── ui.lua
```
## ⌨️ Atalhos

|   Atalho     |  Modo  |             Descrição                 |
|--------------|--------|---------------------------------------|
| `<leader>ff` | Normal | Buscar arquivos (Telescope)           |
| `<leader>fg` | Normal | Buscar texto no projeto (grep)        |
| `<leader>fb` | Normal | Buscar buffers abertos                |
| `<leader>fh` | Normal | Buscar help                           |
| `<leader>fr` | Normal | Arquivos recentes                     |
| `<leader>fc` | Normal | Buscar na config do NeoVim            |
| `<leader>w`  | Normal | Salvar arquivo                        |
| `<leader>q`  | Normal | Sair                                  |
| `<leader>x`  | Normal | Salvar e sair                         |
| `<leader>n`  | Normal | Criar novo arquivo                    |
| `<leader>m`  | Normal | Renomear arquivo atual                |
| `<leader>rn` | Normal | Renomear variável (LSP)               |
| `<leader>fmt`| Normal | Formatar arquivo                      |
| `<leader>rt` | Normal | Rodar Python                          |
| `<leader>rc` | Normal | Rodar C++                             |
| `<leader>rj` | Normal | Rodar Java                            |
| `<leader>rf` | Normal | Rodar Flet                            |
| `<leader>rv` | Normal | Reload config NeoVim                  |
| `<leader>sv` | Normal | Split vertical                        |
| `<leader>sh` | Normal | Split horizontal                      |
| `<leader>sc` | Normal | Fecha split                           |
| `<leader>s+` | Normal | Aumenta split vertical                |
| `<leader>s-` | Normal | Diminui split vertical                |
| `<leader>s>` | Normal | Aumenta split horizontal              |
| `<leader>s<` | Normal | Diminui split horizontal              |
| `<leader>sH` | Normal | Move split pra esquerda               |
| `<leader>sJ` | Normal | Move split pra baixo                  |
| `<leader>sK` | Normal | Move split pra cima                   |
| `<leader>sL` | Normal | Move split pra direita                |
| `<leader>se` | Normal | Iguarlar splits                       |
| `<leader>tt` | Normal | Abrir terminal                        |
| `<leader>dt` | Normal | Toggle Breakpoint                     |
| `<leader>dc` | Normal | Continuar debug                       |
| `<leader>du` | Normal | Toggle UI do debug                    |
| `<leader>dx` | Normal | Encerrar debug                        |
| `<leader>db` | Normal | Toggle Breakpoint                     |
| `<leader>gp` | Normal | Preview Git Hunk                      |
| `<leader>gb` | Normal | Git Blame linha                       |
| `<leader>tb` | Normal | Toggle transparência                  |
| `<leader>tf` | Normal | Toggle float NvimTree                 |
| `<leader>ts` | Normal | Toggle lado NvimTree                  |
| `<leader>mm` | Normal | Comentar linha                        |
| `<leader>?`  | Normal | Menu de atalhos                       |
| `<C-a>`      | Normal | Toggle NvimTree                       |
| `<C-h>`      | Normal | Janela esquerda                       |
| `<C-j>`      | Normal | Janela abaixo                         |
| `<C-k>`      | Normal | Janela acima                          |
| `<C-l>`      | Normal | Janela direita                        |
| `<C-d>`      | Normal | Copiar linha                          |
| `<Tab>`      | Normal | Indentar linha                        |
| `<S-Tab>`    | Normal | Desindentar linha                     |
| `<Tab>`      | Visual | Indentar bloco                        |
| `<S-Tab>`    | Visual | Desindentar bloco                     |
| `<Alt-j>`    | Normal/Visual | Mover linha(s) para baixo      |
| `<Alt-k>`    | Normal/Visual | Mover linha(s) para cima       |
| `<F5>`       | Normal | Debug: Continuar                      |
| `<F9>`       | Normal | Debug: Toggle Breakpoint              |
| `<F10>`      | Normal | Debug: Step Over                      |
| `<F11>`      | Normal | Debug: Step Into                      |
| `<F12>`      | Normal | Debug: Step Out                       |
| `:Theme`     | Comando | Mudar tema                           |
| `:Menu`      | Comando | Menu de atalhos                      |
| `:Lazy`      | Comando | Gerenciar plugins                    |
| `:TSUpdate`  | Comando | Atualizar ícones de TreeSitter       |

## 📝 Notas importantes

⚠️**Atenção**: As minhas configurações podem ser instáveis e podem não funcionar corretamente em todos os sistemas, Tenha noção básica sobre!. Use com cautela e faça backups de seus arquivos de configuração.

---
## 👨‍💻 Autor

Desenvolvido com ❤️ por [TheRake]

- GitHub: [@TheRake066](https://github.com/TheRake066)
- Email: sidneyvr01@gmail.commands

## 🙏 Agradecimentos

- [@nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [@nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [@nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [@nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)
- [@nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)

<div align="center">

**⭐ Se este projeto foi útil para você, considere dar uma estrela!**

</div>
