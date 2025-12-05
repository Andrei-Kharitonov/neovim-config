-- Tab line with active buffers
return {
  "nanozuki/tabby.nvim",
  config = function()
    local theme = {
      fill = "TabLine",
      head = "TabLineFill",
      current_tab = "TabLineSel",
      tab = "TabLineFill",
      win = "TabLineSel",
      tail = "TabLineFill",
    }
    require("tabby").setup({
      line = function(line)
        return {
          {
            line.sep(" ", theme.head, theme.fill),
          },
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep("", theme.win, theme.fill),
              win.is_current() and "" or "",
              win.buf_name(),
              line.sep("", theme.win, theme.fill),
              hl = theme.win,
              margin = " ",
            }
          end),
          line.spacer(),
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("", hl, theme.fill),
              tab.is_current() and "" or "",
              tab.number(),
              line.sep("", hl, theme.fill),
              hl = hl,
              margin = " ",
            }
          end),
          {
            line.sep(" ", theme.tail, theme.fill),
          },
          hl = theme.fill,
        }
      end,
      -- option = {}, -- setup modules' option,
    })
  end,
}
