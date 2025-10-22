-- Theme
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin")

    -- fix neotree border color for catppuccin-mocha
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#181825", bg = "#181825" })
    -- fix telescope bg color for catppuccin-mocha
    vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1e1e2e" })
    -- fix snippets border bg color for catppuccin-mocha
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e" })
  end,
}
