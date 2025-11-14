-- Status line
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
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

    local function wordCount()
      if vim.bo.buftype ~= "" then
        return ""
      end
      if vim.bo.filetype == "text" or vim.bo.filetype == "markdown" then
        local wc = vim.fn.wordcount()
        if vim.fn.mode():match("[Vv]") then
          return string.format("%d words", wc.visual_words or 0)
        else
          return string.format("%d words", wc.words or 0)
        end
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
        },
        lualine_x = { "searchcount", wordCount, "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "diagnostics" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      -- top line
      winbar = {
        lualine_a = {},
        lualine_b = { { "filename", path = 1, shorting_target = 5 } },
        lualine_c = {},
        lualine_x = { "encoding", "fileformat" },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1, shorting_target = 5 } },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
