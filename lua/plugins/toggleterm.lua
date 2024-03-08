return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				-- Configuration options for toggleterm
				open_mapping = [[<c-\>]], -- Keybinding to open the terminal
				hide_numbers = true, -- Hide the number column in toggleterm buffers
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float", -- Terminal opens in a floating window
				close_on_exit = true, -- Close the terminal window when the process exits
				shell = vim.o.shell, -- Use the default shell
			})

			-- Function to open lazygit in a floating terminal
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

			function _lazygit_toggle()
				lazygit:toggle()
			end

			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			-- Keybinding to toggle lazygit
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gi",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
