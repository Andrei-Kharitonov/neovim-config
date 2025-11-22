return {
  {
    -- Git integration for buffers
    "lewis6991/gitsigns.nvim",
  },
  {
    -- Git commands for vim
    "tpope/vim-fugitive",
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
      { "<Leader>gg", ":LazyGit<CR>", desc = "LazyGit" },
    },
  },
}
