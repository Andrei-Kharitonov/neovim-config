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

    -- bold window borders
    vim.opt.fillchars = {
      horiz = "━",
      horizup = "┻",
      horizdown = "┳",
      vert = "┃",
      vertleft = "┫",
      vertright = "┣",
      verthoriz = "╋",
    }

    -- diagnostic underline style
    local hl_groups = { 'DiagnosticUnderlineError', 'DiagnosticUnderlineWarn', 'DiagnosticUnderlineInfo' }
    for _, hl in ipairs(hl_groups) do
        vim.cmd.highlight(hl .. ' gui=undercurl')
    end

    -- diagnostic icons
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " ",
        },
      },
    })
  end,
}
