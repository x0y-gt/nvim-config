return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
    {
      "zbirenbaum/copilot-cmp",
      config = function ()
	require("copilot_cmp").setup()
      end 
    },
  },
  config = function()
    local cmp = require'cmp'

    cmp.setup({
      snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	end,
      },
      window = {
	completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
	["<C-k>"] = cmp.mapping.select_prev_item(),
	["<C-j>"] = cmp.mapping.select_next_item(),
	["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
	["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
	-- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- ["<C-e>"] = cmp.mapping {
	--   i = cmp.mapping.abort(),
	--   c = cmp.mapping.close(),
	-- },
	-- ["<CR>"] = cmp.mapping.confirm({
	--   select = false, -- true,
	--   behavior = cmp.ConfirmBehavior.Replace,
	-- }),
	-- ["<Tab>"] = cmp.mapping(function(fallback)
	--   if cmp.visible() then
	--     cmp.select_next_item()
	--   -- elseif luasnip.expandable() then
	--   --   luasnip.expand()
	--   -- elseif luasnip.expand_or_jumpable() then
	--   --   luasnip.expand_or_jump()
	--   elseif check_backspace() then
	--     fallback()
	--   else
	--     fallback()
	--   end
	-- end, {
	--   "i",
	--   "s",
	-- }),
	-- ["<S-Tab>"] = cmp.mapping(function(fallback)
	--   if cmp.visible() then
	--     cmp.select_prev_item()
	--   -- elseif luasnip.jumpable(-1) then
	--   --   luasnip.jump(-1)
	--   else
	--     fallback()
	--   end
	-- end, {
	--   "i",
	--   "s",
	-- }),
      }),
      sources = cmp.config.sources({
	{ name = "copilot", priority = 9, max_item_count = 5, keyword_length = 0, group_index = 2 },
	{ name = 'buffer', keyword_length = 2 },
	{ name = 'path' },
	{ name = 'vsnip', keyword_length = 2 },
      })
    })
  end
}
