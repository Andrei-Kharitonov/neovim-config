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
      title = " Global note ",
      window_config = function()
        local window_height = vim.api.nvim_list_uis()[1].height
        local window_width = vim.api.nvim_list_uis()[1].width
        return {
          relative = "editor",
          border = "rounded",
          title = "Note",
          title_pos = "center",
          width = math.floor(0.7 * window_width),
          height = math.floor(0.85 * window_height),
          row = math.floor(0.05 * window_height),
          col = math.floor(0.15 * window_width),
        }
      end,
    })
  end,
}
