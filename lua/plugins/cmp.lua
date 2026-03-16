-- ═══════════════════════════════════════════════════════════════
--  CMP (Autocompletion) Config
-- ═══════════════════════════════════════════════════════════════

local cmp = require("cmp")
local luasnip = require("luasnip")

-- Setup
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  }),
  sources = {
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'luasnip', priority = 750 },
    { name = 'buffer', priority = 500 },
    { name = 'path', priority = 250 },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

-- Snippets
require("luasnip").add_snippets("python", {
  luasnip.snippet("pf", {
    luasnip.text_node("print(f\""),
    luasnip.insert_node(1, "variavel"),
    luasnip.text_node("\")"),
  }),
  luasnip.snippet("def", {
    luasnip.text_node("def "),
    luasnip.insert_node(1, "nome_funcao"),
    luasnip.text_node("("),
    luasnip.insert_node(2, "parametros"),
    luasnip.text_node("):"),
    luasnip.text_node({ "", "    " }),
    luasnip.insert_node(0),
  }),
  luasnip.snippet("ifmain", {
    luasnip.text_node({ "if __name__ == \"__main__\":", "    " }),
    luasnip.insert_node(0),
  }),
})

print("✅ CMP configurado!")

