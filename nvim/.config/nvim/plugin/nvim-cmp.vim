lua << EOF
-- -----------------------------------------------------------
-- Setup nvim-cmp
-------------------------------------------------------------
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'luasnip', keyword_length = 2, max_item_count = 5 },
      { name = 'nvim_lsp', keyword_length = 3, max_item_count = 5 },
      { name = 'path', keyword_length = 3, max_item_count = 5 },
      { name = 'buffer', keyword_length = 3, max_item_count = 5 },
    },
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[lsp]",
          luasnip = "[snip]",
        }
      }
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    }
})

-- -----------------------------------------------------------
-- Snippets setup 
-- -----------------------------------------------------------
require("luasnip.loaders.from_vscode").lazy_load()
EOF

" some tab autocompletion mappings from theprimeagaon dot files
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
