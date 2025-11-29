-- Global note for neovim
return {
  "backdround/global-note.nvim",
  config = function()
    require("global-note").setup({
      filename = "global.md",
      directory = "~/Documents/notes/",
      additional_presets = {
        nvim = {
          filename = "neovim.md",
          command_name = "NvimNote",
        },
        nixos = {
          filename = "nixos.md",
          command_name = "NixosNote",
        },
      },
    })
  end,
}
