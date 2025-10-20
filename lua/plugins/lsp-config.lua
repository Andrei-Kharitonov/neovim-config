return {
  {
    -- Lsp manager
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    -- Lsp install
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- lua
          "html", -- html
          "cssls", -- css, scss
          "vtsls", -- js, ts, jsx, tsx
          "jsonls", -- json
          "nil_ls", -- nix
          "pyright", -- python
          "clangd", -- c, c++
        }
      })
    end
  },
  {
    -- Lsp config
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities
      })
      vim.lsp.config("html", {
        capabilities = capabilities
      })
      vim.lsp.config("cssls", {
        capabilities = capabilities
      })
      vim.lsp.config("vtsls", {
        capabilities = capabilities
      })
      vim.lsp.config("jsonls", {
        capabilities = capabilities
      })
      vim.lsp.config("nil_ls", {
        capabilities = capabilities
      })
      vim.lsp.config("pyright", {
        capabilities = capabilities
      })
      vim.lsp.config("clangd", {
        capabilities = capabilities
      })
    end
  }
}
