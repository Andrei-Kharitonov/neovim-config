-- Custom numberline
return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        {
          sign = { name = { 'Diagnostic.*' }, colwidth = 1 },
          condition = { builtin.not_empty },
        },
        {
          text = { "%s" },
          sign = {
            namespace = { 'gitsigns' },
            maxwidth = 1,
            colwidth = 1,
          },
          condition = { builtin.not_empty },
        },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
        },
      },
    })
  end,
}