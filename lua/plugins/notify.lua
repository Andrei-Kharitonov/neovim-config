-- Notifications pop-up
return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  config = function()
    require("notify").setup({
      timeout = 3000,
      minimum_width = 30,
      stages = "static",
    })

    vim.notify = require("notify")
  end
}
