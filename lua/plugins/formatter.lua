return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")
		local filetypes = {
			lua = { require("formatter.filetypes.lua").stylua },
			python = { require("formatter.filetypes.python").black },
			javascript = { require("formatter.filetypes.javascript").prettier },
			typescript = { require("formatter.filetypes.javascript").prettier },
			javascriptreact = { require("formatter.filetypes.javascript").prettier },
			typescriptreact = { require("formatter.filetypes.javascript").prettier },
			vue = { require("formatter.filetypes.javascript").prettier },
			graphql = { require("formatter.filetypes.graphql").prettier },
			json = { require("formatter.filetypes.json").fixjson },
			markdown = { require("formatter.filetypes.javascript").prettier },
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
				function()
					-- Ignore already configured types.
					local defined_types = require("formatter.config").values.filetype
					if defined_types[vim.bo.filetype] ~= nil then
						return nil
					end
					vim.lsp.buf.format({ async = true })
				end,
			},
			--      ["*"] = {
			-- require("formatter.filetypes.any").remove_trailing_whitespace,
			-- function()
			--   vim.lsp.buf.format({ async = true })
			-- end,
			--      },
		}

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = false,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = filetypes,
		})

		vim.keymap.set("n", "<leader>f", function()
			if filetypes[vim.bo.filetype] ~= nil then
				vim.cmd([[Format]])
			else
				vim.lsp.buf.format()
			end
		end)
		-- Set up an autocmd to format on save
		vim.cmd([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * FormatWrite
      augroup END
    ]])
	end,
}
