-- Keymaps
local function opts(d)
  return { silent = true, noremap = true, desc = d }
end

vim.keymap.set("i", "jj", "<ESC>", opts("Double j to esc"))
vim.keymap.set("n", "<Leader>/", ":noh<CR>", opts("Clear search highlight"))
vim.keymap.set("n", "<Leader>dd", ":BufDel<CR>", opts("Delete buffer"))
vim.keymap.set("n", "<Leader>dh", ":DelHiddenBufs<CR>", opts("Delete all hidden buffers"))
vim.keymap.set("v", "<Leader>p", "\"_dP", opts("Paste without copy deleted"))
vim.keymap.set("v", "<C-c>", "\"+y", opts("Copy to clipboard"))
vim.keymap.set("i", "<C-v>", "<C-r>+", opts("Paste from clipboard"))
vim.keymap.set("v", "<C-x>", "\"+d", opts("Cut to clipboard"))
vim.keymap.set("n", "<C-/>", "gcc", opts("Comment line"))
vim.keymap.set("v", "<C-/>", "gc", opts("Comment selected lines"))

-- Navigation
vim.keymap.set("i", "<C-h>", "<Left>", opts())
vim.keymap.set("i", "<C-j>", "<Down>", opts())
vim.keymap.set("i", "<C-k>", "<Up>", opts())
vim.keymap.set("i", "<C-l>", "<Right>", opts())
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts())
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts())

-- Lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Lsp show docs"))
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, opts("Lsp go definition"))
vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, opts("Lsp show references"))
vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, opts("Lsp format file"))
vim.keymap.set({"n", "v"}, "<Leader>ca", vim.lsp.buf.code_action, opts("Lsp show code actions"))
vim.keymap.set("n", "<Leader>di", vim.diagnostic.open_float, opts("Show diagnostic"))

-- Plugins keymaps
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", opts("File explorer"))
vim.keymap.set("n", "<Leader>w", ":WinShift<CR>", opts("Move window"))
vim.keymap.set("n", "<Leader>r", ":Registers<CR>", opts("Registers"))
vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>", opts("Zen mode"))
vim.keymap.set("n", "<Leader>u", ":lua require('undotree').toggle()<CR>", opts("Undo history"))
vim.keymap.set("n", "<Leader>s", ":lua require('spectre').toggle()<CR>", opts("Search and replace"))
vim.keymap.set("n", "<Leader>yz", ":Yazi cwd<CR>", opts("Open yazi"))
vim.keymap.set("n", "<Leader>?", ":lua require('which-key').show({keys='<Leader>'})<CR>", opts("Show keymaps"))

-- telescope
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opts("Search files in directory"))
vim.keymap.set("n", "<Leader>F", ":Telescope<CR>", opts("Search"))
vim.keymap.set("n", "<Leader>ff", ":Telescope current_buffer_fuzzy_find<CR>", opts("Search in file"))
vim.keymap.set("n", "<Leader>fs", ":Telescope live_grep<CR>", opts("Search in directory"))
vim.keymap.set("n", "<Leader>fl", ":Telescope file_browser<CR>", opts("Open file browser"))
vim.keymap.set("n", "<Leader>fL", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts("Open file browser in file location"))
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", opts("Search buffers"))
vim.keymap.set("n", "<Leader>fg", ":Telescope git_status<CR>", opts("Git status"))
vim.keymap.set("n", "<Leader>fp", ":NeovimProjectHistory<CR>", opts("Projects directories"))
vim.keymap.set("n", "<Leader>fn", ":Telescope notify<CR>", opts("Notifications"))

-- flash
vim.keymap.set({"n", "x", "o"}, "s", "<cmd>lua require('flash').jump()<CR>", opts("Flash"))
vim.keymap.set({"n", "x", "o"}, "S", "<cmd>lua require('flash').treesitter()<CR>", opts("Flash treesitter"))
vim.keymap.set("o", "r", "<cmd>lua require('flash').remote()<CR>", opts("Remote flash"))
vim.keymap.set({"x", "o"}, "R", "<cmd>lua require('flash').treesitter_search()<CR>", opts("Treesitter search"))
vim.keymap.set("c", "<C-s>", "<cmd>lua require('flash').toggle()<CR>", opts("Toggle flash search"))

-- git-signs
vim.keymap.set("n", "<Leader>ghp", ":Gitsigns preview_hunk<CR>", opts("Git preview hunk"))
vim.keymap.set("n", "<Leader>ghr", ":Gitsigns reset_hunk<CR>", opts("Git reset hunk"))
vim.keymap.set("n", "<Leader>ghs", ":Gitsigns stage_hunk<CR>", opts("Git stage hunk"))

-- trouble
vim.keymap.set("n", "<Leader>xx", ":Trouble diagnostics toggle<CR>", opts("Diagnostics (Trouble)"))
vim.keymap.set("n", "<Leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", opts("Buffer Diagnostics (Trouble)"))
vim.keymap.set("n", "<Leader>cs", ":Trouble symbols toggle focus=false<CR>", opts("Symbols (Trouble)"))
vim.keymap.set("n", "<Leader>cl", ":Trouble lsp toggle focus=false win.position=right<CR>", opts("LSP Definitions (Trouble)"))

-- treesj
vim.keymap.set("n", "<Leader>ts", ":TSJSplit<CR>", opts("Expand block of code"))
vim.keymap.set("n", "<Leader>tj", ":TSJJoin<CR>", opts("Shrink block of code"))
vim.keymap.set("n", "<Leader>tt", ":TSJToggle<CR>", opts("Expand/shrink block of code"))
vim.keymap.set("n", "<Leader>T", ":lua require('treesj').toggle({ split = {recursive = true} })<CR>", opts("Expand/shrink all blocks"))

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<Leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list(), { title_pos = "center" }) end, opts("Harpoon menu"))
vim.keymap.set("n", "<Leader>ha", function() harpoon:list():add() end, opts("Harpoon add"))
vim.keymap.set("n", "<Leader>hn", function() harpoon:list():next({ ui_nav_wrap = true }) end, opts("Harpoon next"))
vim.keymap.set("n", "<Leader>hp", function() harpoon:list():prev({ ui_nav_wrap = true }) end, opts("Harpoon prev"))
vim.keymap.set("n", "<Leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<Leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<Leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<Leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<Leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<Leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<Leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<Leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<Leader>9", function() harpoon:list():select(9) end)

-- icons picker
vim.keymap.set("n", "<Leader><Leader>i", ":IconPickerNormal<CR>", opts("Icon picker"))
vim.keymap.set("n", "<Leader><Leader>y", ":IconPickerYank<CR>", opts("Icon picker yank"))

-- markdown render
vim.keymap.set("n", "<Leader><Leader>mr", ":RenderMarkdown buf_toggle<CR>", opts("Markdown render toggle"))
vim.keymap.set("n", "<Leader><Leader>mp", ":RenderMarkdown preview<CR>", opts("Markdown render preview"))
vim.keymap.set("n", "<Leader><Leader>mf", ":lua require('nabla').popup()<CR>", opts("Formula preview"))

-- resize windows
vim.keymap.set("n", "<A-Left>", ":lua require('smart-splits').resize_left()<CR>", opts("Resize window left"))
vim.keymap.set("n", "<A-Down>", ":lua require('smart-splits').resize_down()<CR>", opts("Resize window down"))
vim.keymap.set("n", "<A-Up>", ":lua require('smart-splits').resize_up()<CR>", opts("Resize window up"))
vim.keymap.set("n", "<A-Right>", ":lua require('smart-splits').resize_right()<CR>", opts("Resize window right"))
-- moving between splits
vim.keymap.set("n", "<C-h>", ":lua require('smart-splits').move_cursor_left()<CR>", opts("Move to left window"))
vim.keymap.set("n", "<C-j>", ":lua require('smart-splits').move_cursor_down()<CR>", opts("Move to bottom window"))
vim.keymap.set("n", "<C-k>", ":lua require('smart-splits').move_cursor_up()<CR>", opts("Move to top window"))
vim.keymap.set("n", "<C-l>", ":lua require('smart-splits').move_cursor_right()<CR>", opts("Move to right window"))
-- swapping buffers between windows
vim.keymap.set("n", "<Leader><Leader>h", ":lua require('smart-splits').swap_buf_left()<CR>", opts("Swap buffer left"))
vim.keymap.set("n", "<Leader><Leader>j", ":lua require('smart-splits').swap_buf_down()<CR>", opts("Swap buffer down"))
vim.keymap.set("n", "<Leader><Leader>k", ":lua require('smart-splits').swap_buf_up()<CR>", opts("Swap buffer up"))
vim.keymap.set("n", "<Leader><Leader>l", ":lua require('smart-splits').swap_buf_right()<CR>", opts("Swap buffer right"))
