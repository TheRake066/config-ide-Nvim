-- Minha NeoVim Config (init.lua)
-- Estilo IDE moderna, rápido e atualizada

---------------------------
-- 1. Gerenciador: Lazy.nvim
---------------------------
-- Certifique-se que Lazy está instalado:
-- https://github.com/folke/lazy.nvim

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", 
    "https://github.com/folke/lazy.nvim", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Temas
  { "folke/tokyonight.nvim" },

  -- Interface e Status
  -- NvimTree com bordas flutuantes
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup({
        view = {
          float = {
            enable = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 35,
              height = 30,
              row = 1,
              col = 1,
            },
          },
        },
      })
    end
  },

  -- Bufferline (barra de abas)
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("bufferline").setup{
        options = {
          mode = "buffers",
          separator_style = "slant",
          diagnostics = "nvim_lsp",
          offsets = {
            { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true },
          },
        },
      }
    end
  },

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup({
        theme = 'doom',
        config = {
          header = {
            '███╗   ██╗██╗   ██╗██╗███╗   ███╗',
            '████╗  ██║██║   ██║██║████╗ ████║',
            '██╔██╗ ██║██║   ██║██║██╔████╔██║',
            '██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
            '██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
            '╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
          },
          center = {
            { icon = '  ', desc = 'Novo Arquivo', action = 'enew' },
            { icon = '  ', desc = 'Buscar Arquivo', action = 'Telescope find_files' },
            { icon = '  ', desc = 'Buscar Texto', action = 'Telescope live_grep' },
            { icon = '  ', desc = 'Atalhos', action = 'WhichKey' },
          },
        },
      })
    end
  },

  -- Which-Key para mostrar todos os atalhos
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
      require("which-key").register({
        ["<leader>d"] = { name = "Debug", c = "Continuar", t = "Breakpoint", u = "UI" },
        ["<leader>f"] = { name = "Arquivo", f = "Buscar Arquivo", r = "Recentes" },
      })
    end,
    event = "VeryLazy"
  },
  { "nvim-lualine/lualine.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "andweeb/presence.nvim" },
  { "folke/which-key.nvim" },
  { "nvim-neotest/nvim-nio" },

  -- LSP, Autocompletar e Snippets
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Formatação e Lint
  { "nvimtools/none-ls.nvim" },

  -- Debug
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Busca poderosa
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Autopairs
  { "windwp/nvim-autopairs" },
})

---------------------------
-- 2. Aparência
---------------------------
vim.cmd.colorscheme("tokyonight")
vim.o.termguicolors = true

---------------------------
-- 3. Básico
---------------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "utf-8"
vim.o.background = "dark"

---------------------------
-- 4. Plugins de Interface
---------------------------
require("lualine").setup()
require("nvim-tree").setup()
require("gitsigns").setup()
require("which-key").setup {}
require("nvim-autopairs").setup {}
require("presence").setup {
  neovim_image_text = "Mr. Sidney codando no Neovim",
  main_image = "file",
}

---------------------------
-- 5. LSP e Autocompletar
---------------------------
local lspconfig = require("lspconfig")
local cmp = require("cmp")

-- Ativa LSP do Python com pyright
lspconfig.pyright.setup({})

-- Autocomplete com LuaSnip
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

---------------------------
-- 6. Formatação (null-ls)
---------------------------
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
  },
})

---------------------------
-- 7. Debug com UI
---------------------------
local dap = require("dap")

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch arquivo atual',
    program = '${file}', -- Arquivo atual
    pythonPath = 'python3'
  }
}

local dapui = require("dapui")
dapui.setup()

-- Atalhos úteis
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>du", dapui.toggle)

vim.keymap.set('n', '<F5>', function() require'dap'.continue() end)
vim.keymap.set('n', '<F10>', function() require'dap'.step_over() end)
vim.keymap.set('n', '<F11>', function() require'dap'.step_into() end)
vim.keymap.set('n', '<F12>', function() require'dap'.step_out() end)
vim.keymap.set('n', '<leader>db', function() require'dap'.toggle_breakpoint() end)

---------------------------
-- 8. Treesitter
---------------------------
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
})

---------------------------
-- 9. Telescope
---------------------------
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)

--------------------------
-- Criar Arquivo
--------------------------
vim.keymap.set("n", "<leader>n", function()
  local nome = vim.fn.input("Nome do novo arquivo: ")
  if nome ~= "" then
    vim.cmd("edit " .. nome)
  end
end, { desc = "Criar novo arquivo" })

---------------------------
-- Renomear Arquivo
---------------------------
vim.keymap.set("n", "<leader>m", function()
  local antigo = vim.fn.expand("%")
  local novo = vim.fn.input("Novo nome: ", antigo)
  if novo ~= "" and novo ~= antigo then
    vim.cmd("saveas " .. novo)
    vim.fn.delete(antigo)
    vim.cmd("bdelete #")
    print("Renomeado para " .. novo)
  end
end, { desc = "Renomear arquivo atual" })

-- Mover linhas estilo VSCode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Copiar linha atual
vim.keymap.set("n", "<C-d>", "yyP")

-- Borda arredondada para LSP (hover e signature)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

---------------------------
-- 10. Remaps clássicos
---------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<C-a>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>/", "gcc", { remap = true })
vim.keymap.set("n", "<leader>rt", ":vsplit | terminal python3 '%'<CR>", { desc = "Rodar Python em terminal separado" })
vim.keymap.set("n", "<leader>tt", ":split | terminal<CR>", { desc = "Abrir terminal abaixo" })

---------------------------
-- Debug corrigido
---------------------------

local dap = require('dap')

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Debug Python Atual',
    program = '${file}',
    pythonPath = function()
      return 'python3'
    end,
  },
}

---------------------------
-- Fim da configuração
---------------------------
