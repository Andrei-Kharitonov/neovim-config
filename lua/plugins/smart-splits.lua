-- Windows resize and navigation
return {
  'mrjones2014/smart-splits.nvim',
  event = 'VeryLazy',
  config = function()
    require('smart-splits').setup({
      default_amount = 1
    })
  end,
}