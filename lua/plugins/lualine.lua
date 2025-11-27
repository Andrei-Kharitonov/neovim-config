-- Status line
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local ignoreFiletypes = {
      "neo-tree",
      "dashboard",
      "TelescopePrompt",
      "grapple",
      "undotree",
      "registers",
    }

    local function hasValue(tab, val)
      for _, value in ipairs(tab) do
        if value == val then
          return true
        end
      end
      return false
    end

    local function visualLinesCount()
      local isVisualMode = vim.fn.mode():find("[Vv]")
      if not isVisualMode then
        return ""
      end
      local starts = vim.fn.line("v")
      local ends = vim.fn.line(".")
      local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
      return tostring(lines)
    end

    local function visualBlockSize()
      if vim.fn.mode() ~= "\22" then
        return ""
      end
      local start_pos = vim.fn.getpos("v")
      local end_pos = vim.fn.getpos(".")
      local start_line = math.min(start_pos[2], end_pos[2])
      local end_line = math.max(start_pos[2], end_pos[2])
      local start_col = math.min(start_pos[3], end_pos[3])
      local end_col = math.max(start_pos[3], end_pos[3])
      local height = end_line - start_line + 1
      local width = end_col - start_col + 1
      return string.format("%dx%d", height, width)
    end

    local function grappleTagIndex()
      local grapple = require("grapple")
      local tags = #grapple.tags()
      if grapple.find() ~= nil then
        return string.format(" [%d/%d]", grapple.name_or_index(), tags)
      else
        return ""
      end
    end

    require("lualine").setup({
      options = {
        disabled_filetypes = {
          winbar = { "neo-tree", "dashboard" },
        },
        globalstatus = true,
        component_separators = { left = '│', right = '│'},
        section_separators = { left = '', right = ''},
      },
      -- bottom line
      sections = {
        lualine_a = { "mode", visualLinesCount, visualBlockSize },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          {
            "filename",
            cond = function()
              return not hasValue(ignoreFiletypes, vim.bo.filetype)
            end,
          },
        },
        lualine_x = { "searchcount", "filetype", "encoding", "fileformat" },
        lualine_y = { grappleTagIndex, "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
