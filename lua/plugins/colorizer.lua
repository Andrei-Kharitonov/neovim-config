-- Preview colors
return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    require('colorizer').setup({
      'css',
      'scss',
      'sass',
      'javascript',
      'typescript',
      'html',
      'lua',
      'python',
    })
  end
}