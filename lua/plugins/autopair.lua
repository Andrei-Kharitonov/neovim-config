-- Autoclosing brackets
return {
  'altermo/ultimate-autopair.nvim',
  event = "VeryLazy",
  branch='v0.6',
  config = function()
    require("ultimate-autopair").setup()
  end
}