-- Themes
local function colors_setup(name)
  vim.cmd.colorscheme(name)

  if vim.g.colors_name == "catppuccin-mocha" then
    -- hide neotree separator
    -- vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#181825", bg = "#181825" })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#191921", bg = "#191921" })
    -- fixed for catppuccin + kanagawa bg
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#a5adce", bg = "#363646", bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#54546d", bg = "#2a2a37" }) -- statuscolumn
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#cdd6f5", bg = "#2a2a37" })
  elseif vim.g.colors_name == "kanagawa" then
    -- hide neotree separator
    -- vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#1f1f28", bg = "#1f1f28" })
    -- fix minifiles title
    vim.api.nvim_set_hl(0, "MiniFilesTitle", { bg = "#1f1f28", fg = "#dcd7ba" })
  end
  -- fix telescope bg color
  vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Normal" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Normal" })
  -- fix floating windows colors
  vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  vim.api.nvim_set_hl(0, "FloatTitle", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "Bold" })

  -- diagnostic underline style
  local hl_groups = { "DiagnosticUnderlineError", "DiagnosticUnderlineWarn", "DiagnosticUnderlineInfo" }
  for _, hl in ipairs(hl_groups) do
    vim.cmd.highlight(hl .. " gui=undercurl")
  end
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          mocha = {
            base = "#1f1f28",
            mantle = "#191921",
            crust = "#191921",
            -- base = "#2a2a37",
            -- mantle = "#1f1f28",
            -- crust = "#1f1f28",
          },
        },
      })
      colors_setup("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "wave",
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        overrides = function(colors)
          local theme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require("kanagawa.lib.color")
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end

          return {
            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
          }
        end,
      })
      -- colors_setup("kanagawa")
    end,
  },
}
