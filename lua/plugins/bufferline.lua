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

        sort_by = function(buffer_a, buffer_b)
          local index_a = grapple.name_or_index({ buffer = buffer_a.id })
          local index_b = grapple.name_or_index({ buffer = buffer_b.id })

          if index_a ~= nil and index_b ~= nil then
            return index_a < index_b
          elseif index_a ~= nil and index_b == nil then
            return true
          elseif index_a == nil and index_b ~= nil then
            return false
          else
            return buffer_a.id < buffer_b.id
          end
        end,

        -- sort_by = function(buffer_a, buffer_b)
        --   local index_a = grapple.name_or_index({ buffer = buffer_a.id })
        --   local index_b = grapple.name_or_index({ buffer = buffer_b.id })
        --   if index_a > 0 and index_b > 0 then
        --     return index_a < index_b
        --   end
        --   return buffer_a.id < buffer_b.id
        --
        -- end,
        -- sort_by = "id",

        indicator = { style = "none" },
        diagnostics = "nvim_lsp",
        style_preset = bufferline.style_preset.no_italic,
        show_buffer_close_icons = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = " NEO-TREE",
            padding = 1,
          },
        },
        separator_style = { "│", "│" },
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
