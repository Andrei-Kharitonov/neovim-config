-- Parser
-- NOTE: branch 'master' is depricated
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- web-dev
        "html",
        "css",
        "scss",
        "javascript", -- js, jsx
        "typescript",
        "tsx",
        "php",
        -- coding
        "c",
        "cpp",
        "python",
        -- config
        "json",
        "lua",
        "nix",
        "vim",
        "yaml",
        "gitignore",
        -- docs
        "markdown",
        "vimdoc",
        "comment",
        "xml",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
