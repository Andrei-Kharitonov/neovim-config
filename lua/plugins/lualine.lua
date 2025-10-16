-- Status line
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    options = {
      disabled_filetypes = {
        winbar = {'neo-tree', 'dashboard'}
      },
      globalstatus = true,
    },
    -- bottom line
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff'},
      lualine_c = {'diagnostics'},
      lualine_x = {'searchcount', 'encoding'},
      lualine_y = {{'filetype', icon_only = true}, 'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'diagnostics'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    -- top line
    winbar = {
      lualine_a = {},
      lualine_b = {{'filename', path = 1, shorting_target = 5}},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {{'filename', path = 1, shorting_target = 5}},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    }
  }
}
