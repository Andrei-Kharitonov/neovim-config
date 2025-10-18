-- Keymap viewer
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      triggers = {},
      icons = {
        mappings = false
      },
      plugins = {
        marks = false,
        registers = false,
        spelling = { -- z= to check spelling
          enabled = true,
          suggestions = 10,
        },
      },
    })
  end
}