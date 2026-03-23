-- ═══════════════════════════════════════════════════════════════
--  Barbecue Config (Winbar com breadcrumb)
-- ═══════════════════════════════════════════════════════════════

require("barbecue").setup({
  attach_navic = true,
  show_dirname = true,
  show_basename = true,
  show_modified = true,
  include_buftypes = { "" },
  theme = "auto",
  modified = function(bufnr) return vim.bo[bufnr].modified end,
  modifies = {
    dirname = ":~:.",
  },
  symbols = {
    modified_indicator = "7",
    ellipsis = "…",
    separators = {
        left = " ",
        right = " >",
    },
  },
  kinds = {
    File = "",
    Module = "",
    Namespace = "",
    Package = "",
    Class = "",
    Method = "",
    Property = "",
    Field = "",
    Constructor = "",
    Enum = "",
    Interface = "",
    Function = "",
    Variable = "",
    Constant = "",
    String = "",
    Number = "",
    Boolean = "",
    Array = "",
    Object = "",
    Key = "",
    Null = "",
    EnumMember = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  },
})

