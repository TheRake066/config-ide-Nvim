-- The Rake's NeoVim Config (init.lua)
-- atualidado 22/07/25

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

------------------------------------------------------------
-- Seletor de Temas Automático
local theme_selector = function()
  local themes = {
    "gruvbox",
    "nord",
    "onedarkpro",
    "dracula",
    "solarized-dark",
    "tokyonight",
    "catppuccin",
    "solarized-light"
  }

  vim.ui.select(
    themes,
    { prompt = "Escolha seu tema:" },
    function(choice)
      if choice then
        -- Comenta/remove configurações de tema existentes que podem conflitar
        vim.cmd("highlight clear") -- Limpa highlights anteriores

        -- Configurações específicas para cada tema
        if choice == "gruvbox" then
          vim.cmd("colorscheme gruvbox")
        elseif choice == "nord" then
          vim.cmd("colorscheme nord")
        elseif choice == "onedarkpro" then
          vim.cmd("colorscheme onedarkpro")
        elseif choice == "dracula" then
          vim.cmd("colorscheme dracula")
        elseif choice == "solarized-dark" then
          vim.cmd("colorscheme solarized")
          vim.o.background = "dark"
        elseif choice == "tokyonight" then
          require("tokyonight").setup({
            style = "storm", -- storm, night, moon
            transparent = true,
          })
          vim.cmd("colorscheme tokyonight")
        elseif choice == "catppuccin" then
          require("catppuccin").setup({
            flavour = "frappe", -- latte, frappe, macchiato, mocha
          })
          vim.cmd("colorscheme catppuccin")
        elseif choice == "solarized-light" then
          vim.cmd("colorscheme solarized")
          vim.o.background = "light"
        end

        -- Aplica personalizações comuns
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      end
    end
  )
end

-- Chama o seletor ao iniciar (comente esta linha se quiser controle manual)
vim.schedule(function()
  theme_selector()
end)

---------------------------------------------------------------------------

require("lazy").setup({

  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "dracula/vim", name = "dracula" },
  { "altercation/vim-colors-solarized" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  -- Temas

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
  -- Presence Discord
  {
    "andweeb/presence.nvim",
    config=function()
     require("presence").setup({
      auto_update = true,
      -- Coloque seu nome abaixo
      neovim_image_text = "Mr.<your-name> codando no Neovim",
      main_image = "neovim",
      client_id = "793271441293967371",
      log_level = nil,
      debounce_timeout = 10,
      enable_line_number = false,
      blacklist = {},
      buttons = true,
      file_assets = {},
      show_time = true,
  
      -- Texto Customizado
      editing_text = "Codando %s",
      file_explorer_text = "Navegando Arquivos",
      git_commit_text = "Fazendo commit",
      plugin_manager_text = "Gerenciando plugins...",
      reading_text = "Lendo %s",
      workspace_text = "Trabalhando em %s",
      line_number_text = "Linha %s de %s",
    })
    end
  },
  -- Bufferline (barra de abas)
    -- tema abaixo 
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup {
        style = "warm", -- você pode usar "dark", "darker", "cool", "deep", "warm", "warmer"
        transparent = true,
        term_colors = true,
        code_style = {
          comments = "italic",
          keywords = "bold",
          functions = "bold",
          strings = "none",
          variables = "italic",
        },
    }
      --------------------------------------------------------------------------------------
      -- ATENÇÃO!
      -- Essa configuração abaixo é configurada e não vai ser aplicada!
      -- Caso queira usar, comente a parte aonde escolhe o tema...
      -- Não recomendo usar essa parte
      require("onedark").load()
      -- 🎨 Custom highlights para syntax (Treesitter)
      vim.api.nvim_set_hl(0, "@keyword", { fg = "#e06c75" })
      vim.api.nvim_set_hl(0, "@string", { fg = "#ffdc00" })
      vim.api.nvim_set_hl(0, "@comment", { fg = "#5c6370", italic = true })
      vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#fa6363", bold = true }) -- vermelho
      vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#fa6363", bold = true }) -- vermelho
      vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#fa6363", bold = true }) -- vermelho
      vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#fa6363", bold = true }) -- vermelho
      vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#fa6363", bold = true }) -- vermelho
      vim.api.nvim_set_hl(0, "@keyword.exception", { fg = "#fa6363", bold = true }) -- vermelho
      vim.api.nvim_set_hl(0, "@variable", { fg = "#cdcdcd", italic = true }) -- branco
      vim.api.nvim_set_hl(0, "@module", { fg = "#cdcdcd" }) -- branco
      vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#cdcdcd" }) -- branco
      vim.api.nvim_set_hl(0, "@function", { fg = "#fecf5f" }) -- amarelo
      vim.api.nvim_set_hl(0, "@number", { fg = "#c678dd" }) -- roxo
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#a565b9" }) -- roxo
      vim.api.nvim_set_hl(0, "@function.method", { fg = "#fecf5f" }) -- amarelo
      vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#83ffd1" }) -- azul claro
      vim.api.nvim_set_hl(0, "@number.float", { fg = "#83ffd1" }) -- azul claro
      vim.api.nvim_set_hl(0, "@string.escape", { fg = "#83ffd1" }) -- azul claro
      vim.api.nvim_set_hl(0, "@boolean", { fg = "#008252" }) -- verde
      end,
  },
----------------------------------------------------------------------------------
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
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
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
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
            { icon = '🎨  ', desc = 'Mudar Tema', action = function() theme_selector() end },
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

-- ESSA PARTE FOI COMENTADA POR NÃO SER MAIS USADA;
-- APENAS DESCOMENTE SE QUISER O TEMA TOKYONIGHT;
-- MAS NÃO RECOMENDO NOVAMENTE;

---------------------------
-- 2. Aparência
---------------------------

-- Ativa termguicolors
-- vim.o.termguicolors = true

-- Tema
-- require("tokyonight").setup({
  -- transparent = true,
  -- on_highlights = function(hl, c)
    -- hl.NvimTreeNormal = { bg = "NONE" }
    -- hl.NvimTreeNormalNC = { bg = "NONE" }
    -- hl.NvimTreeEndOfBuffer = { bg = "NONE" }
    -- hl.NvimTreeWinSeparator = { bg = "NONE", fg = "NONE" }
    -- hl.NvimTreeVertSplit = { bg = "NONE", fg = "NONE" }
  -- end,
-- })

-- vim.cmd.colorscheme("tokyonight")

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
vim.o.updatetime = 50
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    source = "always",
    border = "rounded",
  },
})

---------------------------
-- 4. Plugins de Interface
---------------------------
require("lualine").setup()
require("nvim-tree").setup()
require("gitsigns").setup()
require("which-key").setup {}
require("nvim-autopairs").setup {}



vim.o.termguicolors = true

---------------------------
-- 5. LSP e Autocompletar
---------------------------
local lspconfig = require("lspconfig")
local cmp = require("cmp")

-- Ativa LSP do Python com pyright
lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    local last_errors = 0
    local popup_open = false
    
    local check_line = function()
      local line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
      local diags = vim.diagnostic.get(bufnr, { lnum = line_nr })
      local current_errors = #diags
      
      -- Se aparecer um NOVO erro
      if current_errors > 0 and (last_errors == 0 or not popup_open) then
        vim.diagnostic.open_float({
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "TextChangedI" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
        })
        popup_open = true
      
      -- Se TODOS os erros foram corrigidos
      elseif current_errors == 0 and popup_open then
        vim.diagnostic.hide()
        popup_open = false
      end
      
      last_errors = current_errors
    end

    -- Dispara em TODAS as situações relevantes
    vim.api.nvim_create_autocmd({"TextChangedI", "InsertLeave", "CursorHold"}, {
      buffer = bufnr,
      callback = check_line
    })
    
vim.o.updatetime = 250

-- Ativa o popup automaticamente durante o insert (modo insert)
vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
  callback = function()
    local diagnostics = vim.diagnostic.get()
    if diagnostics and #diagnostics > 0 then
      vim.diagnostic.open_float(nil, { focus = false })
    end
  end,
})

-- Oculta o popup se não houver mais erro (ex: após corrigir)
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.diagnostic.hide()
  end,
})
    
    -- Força uma verificação inicial
    check_line()
  end,
  settings = {
    python = {
      analysis = {
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic"
      }
    }
  }
})

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
  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = false,
  },
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
vim.keymap.set("n", "<leader>mm", "gcc", { remap = true })
vim.keymap.set("n", "<leader>rt", ":vsplit | terminal python3 '%'<CR>", { desc = "Rodar Python em terminal separado" })
vim.keymap.set("n", "<leader>rf", ":vsplit | terminal flet run '%'<CR>", { desc = "Rodar Flet em terminal separado" })
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

-- === Comando Personalizado: Menu de Atalhos Hacker ===
vim.api.nvim_create_user_command("MenuHacker", function()
  vim.cmd("echo '🔍️  Telecospe: <leader>ff (buscar), <leader>fr (recentes), <leader>fg (buscar texto)'")
  vim.cmd("echo '🐍  Debug: <leader>dc (continuar), <leader>dt (breakpoint), <leader>du (interface)'")
  vim.cmd("echo '🧠  Movimento: Alt + j/k (mover linhas), Ctrl + d (copiar)'")
  vim.cmd("echo '📦  Plugin: :Lazy, :Mason, :TSUpdate'")
  vim.cmd("echo '🖥️  Terminal: <leader>tt (abre terminal)'")
  vim.cmd("echo '💥  Python: <leader>rt (roda codigo python), <leader>rf (roda codigo flet)'")
  vim.cmd("echo '📂  Arquivo: <leader>w (salva), <leader>x (salvar e sair), <leader>q (sair), <leader>mm (comentar na linha)'")
end, {})

-- Dica: digite :MenuHacker para ver os comandos principais

---------------------------
-- Fim da configuração
---------------------------
