require("config.options")
require("config.commands")
require("config.keymaps")
require("config.lazy")

require("toggleterm").setup()
vim.notify = require("notify")

-- disable deprecated warnings
vim.deprecate = function() end

-- fix neotree border color for catppuccin-mocha
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#181825", bg = "#181825" })