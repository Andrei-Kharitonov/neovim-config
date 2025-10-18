-- Notifications pop-up
return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  opts = {
    timeout = 2500,
    minimum_width = 30,
    stages = "static",
  }
}