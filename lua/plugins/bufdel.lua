-- Keep window after closing buffer
return {
  'ojroques/nvim-bufdel',
  event = 'VeryLazy',
  opts = {
    next = 'tabs',
    quit = true, -- quit Neovim when last buffer is closed
  }
}
