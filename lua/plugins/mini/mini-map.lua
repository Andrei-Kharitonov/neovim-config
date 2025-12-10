-- Buffer overview, scrollbar
return {
  "nvim-mini/mini.map",
  config = function()
    require("mini.map").setup({
      symbols = {
        encode = require("mini.map").gen_encode_symbols.dot("4x2"),
      },
    })
  end,
}
