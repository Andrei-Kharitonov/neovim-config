return {
  {
    -- Render markdown files in neovim
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup({
        completions = { lsp = { enabled = true } },
      })
    end,
  },

  {
    -- Formulas preview
    "jbyuki/nabla.nvim",
    lazy = true,
  },
}
