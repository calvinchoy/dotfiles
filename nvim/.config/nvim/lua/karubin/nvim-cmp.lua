-- -----------------------------------------------------------
-- Setup nvim-cmp
-------------------------------------------------------------
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- local has_words_before = function()
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

cmp.setup({
	window = {
		documentation = {
			border = "single",
			winhighlight = "FloatBorder:LineNr",
		},
		completion = {
			border = "single",
			winhighlight = "FloatBorder:LineNr",
		},
	},
	matching = {
		disallow_fuzzy_matching = true,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	-- autocomplete keybindings and expanding behaviour
	mapping = {
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Use Tab to navigatie autocomplete list
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			-- elseif has_words_before() then
			-- 	cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	-- load cmp wih some additonal extensions for autocompletion
	sources = {
		{ name = "luasnip", keyword_length = 2, max_item_count = 3, priority_weight = 1 },
		{ name = "nvim_lsp", keyword_length = 3, max_item_count = 2, priortiy_weight = 2 },
		{ name = "buffer", keyword_length = 3, max_item_count = 3, priority_weight = 3 },
		{ name = "path", keyword_length = 3, max_item_count = 3, priority_weight = 4 },
		{ name = "nvim_lsp_signature_help" },
	},
	-- menu formatting
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				luasnip = "[snip]",
				nvim_lsp = "[lsp]",
				buffer = "[buf]",
			},
		}),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

-- -----------------------------------------------------------
-- Snippets setup
-- -----------------------------------------------------------
-- Check luasnip github for examples on how to load snippets
require("luasnip.loaders.from_vscode").lazy_load()
