return {
  {
    -- Git integration for buffers
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
  },
  {
    -- Git commands for vim
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    -- Lazygit for neovim
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<Leader>g", ":LazyGit<CR>", desc = "LazyGit" },
    },
  },
}
