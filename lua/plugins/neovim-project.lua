-- Open saved projects
return {
  "coffebar/neovim-project",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  opts = {
    projects = {
      "~/projects/*",
      "~/work/*",
      "~/nixos-config",
      "~/.config/nvim",
    },
    picker = {
      type = "telescope",
    },
    dashboard_mode = true,
    last_session_on_startup = false,
    forget_project_keys = {
      i = "<C-d>",
      n = "d",
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals")
  end,
}
