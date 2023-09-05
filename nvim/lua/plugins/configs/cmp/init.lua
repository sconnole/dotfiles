local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
lspkind.init()

-- cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-nvim-lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require("lspconfig").clangd.setup({ capabilities = capabilities })

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	preselect = cmp.PreselectMode.None, -- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt#L706
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		-- Youtube: How to set up nice formatting for your sources.
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				env_vars = "[env]",
				nvim_lsp = "[lsp]",
				buffer = "[buf]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				jira_issues = "[jira]",
				gh_users = "[gh]",
				home_assistant = "[ha]",
			},
		}),
	},

	experimental = { ghost_text = true },
	mapping = {
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- difference between complete and comfirm?
		["<C-e>"] = cmp.mapping.close(),
		["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		["<C-l>"] = cmp.mapping(function(fallback) -- Next input
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-h>"] = cmp.mapping(function(fallback) -- Prev input
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		--{name = "treesitter"},
		{ name = "jira_issues" },
		-- { name = "home_assistant", max_item_count = 10 },
		{ name = "env_vars", max_item_count = 10 },
		{ name = "gh_users" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer", keyword_length = 3, max_item_count = 10 },
		{ name = "emoji" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
	},
})
