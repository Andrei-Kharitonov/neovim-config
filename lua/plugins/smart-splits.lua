-- Windows resize and navigation
return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup({
      default_amount = 1
    })
  end,
}