-- Buffer overview, scrollbar
return {
  "nvim-mini/mini.map",
  config = function()
    local map = require("mini.map")
    local diagnostic_integration = map.gen_integration.diagnostic({
      error = "DiagnosticFloatingError",
      warn = "DiagnosticFloatingWarn",
      info = "DiagnosticFloatingInfo",
      hint = "DiagnosticFloatingHint",
    })
    map.setup({
      integrations = { diagnostic_integration },
      symbols = {
        encode = map.gen_encode_symbols.dot("4x2"),
      },
    })
  end,
}
