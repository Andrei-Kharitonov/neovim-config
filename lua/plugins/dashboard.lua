-- Start screen
return {
  'nvimdev/dashboard-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  -- event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      shortcut_type = 'number',
      hide = {
        statusline = false,
        tabline = true,
        winbar = true
      },
      config = {
        header = {
          '  N E O V I M  ',
          '',
          '',
        },
        center = {
          {
            icon = ' ',
            desc = 'Projects',
            action = 'NeovimProjectHistory',
            key_format = '  %s',
            key = 'p',
          },
          {
            icon = ' ',
            desc = 'Find files',
            action = 'Telescope find_files',
            key_format = '  %s',
            key = 'f',
          },
          {
            icon = ' ',
            desc = 'Last files',
            action = 'Telescope oldfiles',
            key_format = '  %s',
            key = 'l',
          },
          {
            icon = ' ',
            desc = 'New file',
            action = 'enew',
            key_format = '  %s',
            key = 'n',
          },
          {
            icon = ' ',
            desc = 'Quit',
            action = 'q',
            key_format = '  %s',
            key = 'q',
          }
        },
        -- footer = {},
        vertical_center = true,
      }
    }
  end
}
