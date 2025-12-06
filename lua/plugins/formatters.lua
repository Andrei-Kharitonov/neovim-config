return {
  {
    -- Formatters install
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua", -- lua
          "prettier", -- html, css, js, etc.
          -- "nixfmt", -- nix
          "black", -- python
          "clang-format", -- c, c++
          "eslint_d", -- js, ts linter
        },
      })
    end,
  },
  {
    -- Formatters
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.formatting.nixfmt,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.clang_format,
        },
      })
    end,
  },
}
