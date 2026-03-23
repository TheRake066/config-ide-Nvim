-- ═══════════════════════════════════════════════════════════════
--  Themes Config
-- ═══════════════════════════════════════════════════════════════

local theme_file = vim.fn.stdpath("data") .. "/theme.txt"
local trans_file = vim.fn.stdpath("data") .. "/transparent.txt"

local themes_list = {
  "gruvbox",
  "nord",
  "onedarkpro",
  "dracula",
  "solarized-dark",
  "solarized-light",
  "tokyonight",
  "catppuccin",
  "kanagawa",
  "nightfox",
  "carbonfox",
  "vscode",
  "material",
  "oxocarbon",
  "rose-pine"
}

local function is_transparent()
  if vim.fn.filereadable(trans_file) == 1 then
    return vim.fn.readfile(trans_file)[1] == "true"
  end
  return true
end

_G.apply_theme = function(theme)
  vim.cmd("highlight clear")
  local trans = is_transparent()

  if theme == "gruvbox" then
    require("gruvbox").setup({ transparent_mode = trans })
    vim.cmd("colorscheme gruvbox")
  elseif theme == "nord" then
    vim.cmd("colorscheme nord")
  elseif theme == "onedarkpro" then
    vim.cmd("colorscheme onedarkpro")
  elseif theme == "dracula" then
    vim.cmd("colorscheme dracula")
  elseif theme == "solarized-dark" then
    vim.cmd("colorscheme solarized")
    vim.o.background = "dark"
  elseif theme == "solarized-light" then
    vim.cmd("colorscheme solarized")
    vim.o.background = "light"
  elseif theme == "tokyonight" then
    require("tokyonight").setup({ style = "storm", transparent = trans })
    vim.cmd("colorscheme tokyonight")
  elseif theme == "catppuccin" then
    require("catppuccin").setup({ flavour = "mocha", transparent_background = trans })
    vim.cmd("colorscheme catppuccin")
  elseif theme == "kanagawa" then
    require("kanagawa").setup({ transparent = trans })
    vim.cmd("colorscheme kanagawa")
  elseif theme == "nightfox" then
    vim.cmd("colorscheme nightfox")
  elseif theme == "carbonfox" then
    vim.cmd("colorscheme carbonfox")
  elseif theme == "vscode" then
    require("vscode").setup({ transparent = trans })
    vim.cmd("colorscheme vscode")
  elseif theme == "material" then
    require("material").setup({ style = "deep" })
    vim.cmd("colorscheme material")
  elseif theme == "oxocarbon" then
    vim.cmd("colorscheme oxocarbon")
  elseif theme == "rose-pine" then
    require("rose-pine").setup({ variant = "moon", disable_background = trans })
    vim.cmd("colorscheme rose-pine")
  end

  vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#ffdc00" })

  if trans then
    vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
end

local function load_theme()
  if vim.fn.filereadable(theme_file) == 1 then
    local theme = vim.fn.readfile(theme_file)[1]
    if theme then
      _G.apply_theme(theme)
      return
    end
  end
  _G.apply_theme("onedark")
end

_G.theme_selector = function()
  vim.ui.select(themes_list, { prompt = "Escolha seu tema:" }, function(choice)
    if choice then
      _G.apply_theme(choice)
      vim.fn.writefile({ choice }, theme_file)
      vim.notify("Tema: " .. choice, vim.log.levels.INFO)
    end
  end)
end

_G.toggle_transparent = function()
  local new = not is_transparent()
  vim.fn.writefile({ tostring(new) }, trans_file)
  if vim.fn.filereadable(theme_file) == 1 then
    local theme = vim.fn.readfile(theme_file)[1]
    if theme then
      _G.apply_theme(theme)
    end
  end
  local msg = new and "Transparente ✨" or "Fundo sólido 🎨"
  vim.notify(msg, vim.log.levels.INFO)
end

vim.schedule(load_theme)

vim.api.nvim_create_user_command("Theme", function()
  _G.theme_selector()
end, {})

print("✅ Themes configurado!")
