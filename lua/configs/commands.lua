-- ═══════════════════════════════════════════════════════════════
--  Comandos Personalizados
-- ═══════════════════════════════════════════════════════════════

vim.api.nvim_create_user_command("MenuHelp", function()
  local lines = {
    "                   ⌨️  Menu de Atalhos                   ",
    "──────────────────────────────────────────────────────────",
    "  📁  Arquivos                                            ",
    "     <leader>ff   Buscar arquivos                        ",
    "     <leader>fr   Arquivos recentes                      ",
    "     <leader>fc   Config do NeoVim                       ",
    "     <leader>n    Novo arquivo                           ",
    "     <leader>m    Renomear arquivo                       ",
    "                                                          ",
    "  🔍  Busca                                              ",
    "     <leader>fg   Buscar texto (grep)                    ",
    "     <leader>fb   Buscar buffers                         ",
    "     <leader>fh   Buscar help                            ",
    "                                                          ",
    "  🐍  Debug                                              ",
    "     <leader>dc   Continuar                              ",
    "     <leader>dt   Toggle Breakpoint                      ",
    "     <leader>du   Toggle UI                              ",
    "     <leader>dx   Encerrar Debug                         ",
    "     <F5>         Continuar                              ",
    "     <F10>        Step Over                              ",
    "     <F11>        Step Into                              ",
    "     <F12>        Step Out                               ",
    "                                                          ",
    "  🚀  Rodar                                              ",
    "     <leader>rt   Rodar Python                           ",
    "     <leader>rc   Rodar C++                              ",
    "     <leader>rj   Rodar Java                             ",
    "     <leader>rf   Rodar Flet                             ",
    "     <leader>rn   Renomear variável (LSP)                ",
    "     <leader>rv   Reload Config Neovim                   ",
    "                                                          ",
    "  🧠  Edição                                             ",
    "     <Alt-j/k>    Mover linhas                           ",
    "     <Ctrl-d>     Copiar linha                           ",
    "     <leader>mm   Comentar linha                         ",
    "     <leader>fmt  Formatar arquivo                       ",
    "                                                          ",
    "  🪟  Interface                                          ",
    "     <C-a>        Toggle NvimTree                        ",
    "     <leader>tf   Toggle float NvimTree                  ",
    "     <leader>ts   Toggle lado NvimTree                   ",
    "     <leader>rv   Reload config                          ",
    "                                                          ",
    "  🎨  Temas                                              ",
    "     :Theme       Mudar tema                             ",
    "     <leader>tb   Alternar Transp/Sólido                  ",
    "                                                          ",
    "──────────────────────────────────────────────────────────",
    "              pressione q ou <Esc> para fechar            ",
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = 58
  local height = #lines
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " ⌨️  Atalhos ",
    title_pos = "center",
  })

  vim.api.nvim_set_option_value("filetype", "menu_hacker", { buf = buf })
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
  vim.api.nvim_set_option_value("cursorline", true, { win = win })

  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, nowait = true })

  vim.keymap.set("n", "<Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, nowait = true })
end, {})

vim.keymap.set("n", "<leader>?", function()
  vim.cmd("Menu")
end, { desc = "Menu de atalhos" })

print("✅ CMDs carregados")
