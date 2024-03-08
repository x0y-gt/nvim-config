return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			position = "bottom",
			height = 10,
			icons = false,
			auto_open = false,
			auto_close = true,
			auto_fold = true,
			use_diagnostic_signs = true,
		})

		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>xw", function()
			require("trouble").open("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xd", function()
			require("trouble").open("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xq", function()
			require("trouble").open("quickfix")
		end)
		vim.keymap.set("n", "<leader>xl", function()
			require("trouble").open("loclist")
		end)
	end,
}
