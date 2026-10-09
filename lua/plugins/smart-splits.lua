-- Windows resize and navigation
return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      resize = {
        amount = 1,
        ignored_events = { 'BufEnter', 'WinEnter' },
      },
    })
  end,
}
