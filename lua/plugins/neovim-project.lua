-- Open saved projects
return {
  "coffebar/neovim-project",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "Shatur/neovim-session-manager"
  },
  opts = {
    projects = {
      "C:/Projects-JS/*",
      "C:/Projects-klowd/*",
      "C:/Users/ANDREI/AppData/Local/nvim",
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
}
