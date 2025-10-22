-- Integrated terminal
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  event = 'VeryLazy',
  config = function()
    require("toggleterm").setup()
  end
}
