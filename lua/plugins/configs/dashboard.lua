-- ═══════════════════════════════════════════════════════════════
--  Dashboard Config
-- ═══════════════════════════════════════════════════════════════

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
      '███╗   ██╗██╗   ██╗██╗███╗   ███╗',
      '████╗  ██║██║   ██║██║████╗ ████║',
      '██╔██╗ ██║██║   ██║██║██╔████╔██║',
      '██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
    },
    center = {
      { icon = '󰏗 ', desc = 'Novo Arquivo', action = 'enew' },
      { icon = '󰍉 ', desc = 'Buscar Arquivo', action = 'Telescope find_files' },
      { icon = '󰕍 ', desc = 'Buscar Texto', action = 'Telescope live_grep' },
      { icon = ' ', desc = 'Atalhos', action = 'WhichKey' },
    },
  },
})

