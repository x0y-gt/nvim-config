-- null
-- "windwp/nvim-autopairs",
-- "folke/which-key.nvim",

print(vim.fn.stdpath("data"))
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- global dependencies
	"nvim-lua/plenary.nvim",
	-- 'kyazdani42/nvim-web-devicons',
	"nvim-tree/nvim-web-devicons",

	-- others
	-- {
	--   "stevearc/dressing.nvim",
	--   event = "VeryLazy",
	-- },
	"christoomey/vim-tmux-navigator",
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	"mattn/emmet-vim",
	"wakatime/vim-wakatime",
})

vim.cmd([[colorscheme tokyonight-night]])
