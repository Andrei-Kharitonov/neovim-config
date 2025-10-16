-- Open saved projects
return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/projects/*",
      "~/work/*",
      "~/nixos-config",
    },
    picker = {
      type = "telescope",
    },
    dashboard_mode = true,
    last_session_on_startup = false,
    forget_project_keys = {
      -- insert mode: Ctrl+d
      i = "<C-d>",
      -- normal mode: d
      n = "d"
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}