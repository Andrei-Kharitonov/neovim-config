-- Registers previewer
return {
  "tversteeg/registers.nvim",
  config = function()
    local registers = require("registers")
    registers.setup({
      bind_keys = {
        normal = false,
        visual = false,
        insert = false,
        registers = registers.apply_register({ delay = 0 }),
        ["<Leader>"] = registers.close_window(),
        ["<C-q>"] = registers.close_window(),
      },
      show_empty = false,
      show_register_types = false,
      system_clipboard = false,
      events = {
        on_register_highlighted = false,
      },
      symbols = {
        newline = "⏎",
        space = " ",
        tab = "→",
      },
      window = {
        max_width = 40,
        highlight_cursorline = true,
        border = "rounded",
        transparency = 0,
      },
    })
  end,
}

