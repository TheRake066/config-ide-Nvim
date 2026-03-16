-- ═══════════════════════════════════════════════════════════════
--  Bufferline Config
-- ═══════════════════════════════════════════════════════════════

require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true },
    },
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    numbers = "ordinal",
    max_name_length = 25,
    tab_size = 20,
    indicator = {
      style = "icon",
      icon = "▎",
    },
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
  },
  highlights = {
    buffer_selected = {
      bold = true,
      italic = false,
    },
    diagnostic_selected = {
      bold = true,
    },
  },
})


