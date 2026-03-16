-- ═══════════════════════════════════════════════════════════════
--  Lualine Config
-- ═══════════════════════════════════════════════════════════════

require("lualine").setup({
  options = {
    theme = "auto",
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' � Modifier',
          readonly = ' �锁定 ',
          unnamed = '[No Name]',
          newfile = ' 󰋽 New',
        }
      },
      {
        function()
          local venv = os.getenv("VIRTUAL_ENV")
          if venv then
            return "venv: " .. vim.fn.fnamemodify(venv, ":t")
          end
          return ""
        end,
        icon = "🐍",
      },
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})

