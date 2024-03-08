return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- suggestion = {enabled = true, auto_trigger = true,},
      -- panel = {enabled = true, auto_refresh = false,},
      filetypes = {
	["*"] = true
      }
    })
  end,
} 
