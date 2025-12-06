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
      neotree = "TabLineFill",
    }

    local function is_neotree(str)
      return string.match(str, "^neo%-tree filesystem %[%d+%]$")
        or string.match(str, "^neo%-tree buffers %[%d+%]$")
        or string.match(str, "^neo%-tree git_status %[%d+%]$")
    end

    require("tabby").setup({
      line = function(line)
        return {
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            local offset = string.rep(" ", 11) .. " NEO-TREE" .. string.rep(" ", 12)
            if is_neotree(win.buf_name()) then
              return {
                line.sep(offset,  {fg = "#cdd6f5"}, theme.neotree),
              }
            end
          end),

          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            if not is_neotree(win.buf_name()) then
              return {
                line.sep("", theme.win, theme.fill),
                win.is_current() and "" or "",
                win.buf_name(),
                line.sep("", theme.win, theme.fill),
                hl = theme.win,
                margin = " ",
              }
            end
          end),

          line.spacer(),

          line.tabs().foreach(function(tab)
            if #line.tabs().tabs <= 1 then return "" end
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
    })
  end,
}
