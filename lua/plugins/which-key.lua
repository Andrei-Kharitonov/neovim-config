-- Keymap viewer
return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      triggers = {},
      icons = {
        mappings = false,
      },
      plugins = {
        marks = false,
        registers = false,
        -- z= to check spelling
        spelling = {
          enabled = true,
          suggestions = 10,
        },
      },
    })
  end,
}
