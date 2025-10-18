require("config.options")
require("config.commands")
require("config.keymaps")
require("config.lazy")

vim.notify = require("notify")

-- disable deprecated warnings
vim.deprecate = function() end

-- fix neotree border color for catppuccin-mocha
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#181825", bg = "#181825" })

-- fix telescope bg color for catppuccin-mocha
vim.api.nvim_set_hl(0, 'TelescopeTitle', { bg = '#1e1e2e' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1e1e2e' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#1e1e2e' })