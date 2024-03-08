return {
  'kyazdani42/nvim-tree.lua',
  tag = 'nightly', -- optional, updated every week. (see issue #1193)
  config = function()
    require("nvim-tree").setup({
      -- closes neovim automatically when the tree is the last **WINDOW** in the view
      -- auto_close = true,
      -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
      open_on_tab = false,
      -- hijack the cursor in the tree to put it at the start of the filename
      hijack_cursor = true,
      -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
      update_cwd = true,
      -- show lsp diagnostics in the signcolumn
      diagnostics = {
	enable = true,
	icons = {
	  hint = "",
	  info = "",
	  warning = "",
	  error = "",
	},
      },
      -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
      update_focused_file = {
	-- enables the feature
	enable = true,
	-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
	-- only relevant when `update_focused_file.enable` is true
	update_cwd = true,
	-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
	-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
	ignore_list = {},
      },
      -- configuration options for the system open command (`s` in the tree by default)
      system_open = {
	-- the command to run this, leaving nil should work in most cases
	cmd = nil,
	-- the command arguments as a list
	args = {},
      },
    })

    vim.keymap.set("n", "<Leader>fe", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end
}
