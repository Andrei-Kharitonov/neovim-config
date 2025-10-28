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
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Normal" })
    -- fix floating windows colors for catppuccin-mocha
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  end,
}
