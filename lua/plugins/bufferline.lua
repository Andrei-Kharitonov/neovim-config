-- Top line of buffers and tabs
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics, _)
          local symbols = { error = " ", warn = " " }
          local result = {}
          if diagnostics.error and diagnostics.error > 0 then
            table.insert(result, symbols.error .. diagnostics.error)
          end
          if diagnostics.warning and diagnostics.warning > 0 then
            table.insert(result, symbols.warn .. diagnostics.warning)
          end
          return table.concat(result, " ")
        end,
        style_preset = bufferline.style_preset.no_italic,
        offsets = {
          {
            filetype = "neo-tree",
            text = " NEO-TREE",
            padding = 1,
          },
        },
        separator_style = { "", "" },
      },
    })
  end,
}
