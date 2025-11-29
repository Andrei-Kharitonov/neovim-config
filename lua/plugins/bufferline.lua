-- Top line of buffers and tabs
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")
    local grapple = require("grapple")
    bufferline.setup({
      options = {
        numbers = function(opts) -- adds grapple tag id to buf id
          if grapple.exists({ buffer = opts.id }) then
            local index = grapple.name_or_index({ buffer = opts.id })
            return string.format("%s|%s", opts.id, index)
          else
            return string.format("%s", opts.id)
          end
        end,
        indicator = { icon = "▎" },
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
        show_buffer_close_icons = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = " NEO-TREE",
            padding = 1,
          },
        },
      },
      -- fix highlights for catppuccin theme
      highlights = {
        separator = {
          fg = {
            attribute = "fg",
            highlight = "Pmenu",
          },
        },
        indicator_selected = {
          fg = {
            attribute = "fg",
            highlight = "Pmenu",
          },
        },
        tab_separator = {
          fg = {
            attribute = "fg",
            highlight = "Pmenu",
          },
        },
        tab_separator_selected = {
          fg = {
            attribute = "fg",
            highlight = "Pmenu",
          },
        },
      },
    })
  end,
}
