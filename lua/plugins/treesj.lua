-- Expand and shorten objects, arrays, etc.
return {
  "Wansmer/treesj",
  event = "VeryLazy",
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
}
