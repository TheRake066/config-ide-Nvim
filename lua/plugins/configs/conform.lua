require("conform").setup({
  formatters_by_ft = {
    python     = { "black", "isort" },
    lua        = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    html       = { "prettierd" },
    css        = { "prettierd" },
    json       = { "prettierd" },
    cpp        = { "clang_format" },
    c          = { "clang_format" },
    java       = { "google_java_format" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
