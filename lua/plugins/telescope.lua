return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	dependencies = {
		-- fuzzy finder, dependency: sudo apt install ripgrep fd-find
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				prompt_prefix = "$ ",
				file_ignore_patterns = {
					"^.git/",
					"node_modules",
					"bower_components",
					"vendor",
					".next",
					".pytest_cache",
					".mypy_cache",
					"coverage",
					"build",
					"venv",
				},
				-- delete current buffer when picking a file
				-- mappings = {
					-- i = {
						-- ["<C-x>"] = require("telescope.actions").delete_buffer,
					-- },
				-- },
			},
		})

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		vim.keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find string under cursor in cwd" }
		)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
