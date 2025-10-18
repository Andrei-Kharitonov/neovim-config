-- Top line of buffers and tabs
return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VimEnter',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup {
      options = {
        numbers = "buffer_id",
        style_preset = bufferline.style_preset.no_italic,
        offsets = {
          {
            filetype = "neo-tree",
            text = " NEO-TREE",
            padding = 1,
          },
        },
        indicator = {
          style = "underline"
        },
        separator_style = {"", ""},
      },
    }
  end
}