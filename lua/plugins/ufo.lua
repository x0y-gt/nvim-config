return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	--    event = 'VeryLazy',   -- You can make it lazy-loaded via VeryLazy, but comment out if thing doesn't work
	init = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
	end,
	config = function()
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		require("ufo").setup({
			provider_selector = function(bufnr, filetype)
				return { "lsp", "indent" }
			end,
		})
	end,
}
