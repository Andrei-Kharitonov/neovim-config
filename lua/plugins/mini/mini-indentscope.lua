-- Highlight current tab padding
return {
  "nvim-mini/mini.indentscope",
  config = function()
    require("mini.indentscope").setup()
  end,
}
