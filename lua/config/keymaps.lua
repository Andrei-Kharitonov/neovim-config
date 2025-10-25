-- Keymaps
vim.g.mapleader = " " -- map <Leader> key
vim.g.maplocalleader = "\\"
vim.keymap.set("i", "jj", "<ESC>", { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>/", ":noh<CR>", { silent = true, noremap = true, desc = "Clear search highlight" })
vim.keymap.set("n", "<Leader>dd", ":BufDel<CR>", { silent = true, noremap = true, desc = "Delete buffer" })
vim.keymap.set("n", "<Leader>dh", ":DelHiddenBufs<CR>", { silent = true, noremap = true, desc = "Delete all hidden buffers" })
vim.keymap.set("v", "<C-c>", "\"+y", { silent = true, noremap = true, desc = "Copy to clipboard" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { silent = true, noremap = true, desc = "Paste from clipboard" })
vim.keymap.set("v", "<C-x>", "\"+d", { silent = true, noremap = true, desc = "Cut to clipboard" })
vim.keymap.set("n", "<C-/>", "gcc", { silent = true, remap = true, desc = "Comment line" })
vim.keymap.set("v", "<C-/>", "gc", { silent = true, remap = true, desc = "Comment selected lines" })

-- Navigation
vim.keymap.set("i", "<C-h>", "<Left>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true, noremap = true })
vim.keymap.set("n", "<A-h>", "3h", { silent = true, noremap = true })
vim.keymap.set("n", "<A-j>", "3j", { silent = true, noremap = true })
vim.keymap.set("n", "<A-k>", "3k", { silent = true, noremap = true })
vim.keymap.set("n", "<A-l>", "3l", { silent = true, noremap = true })

-- Lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true, desc = "Lsp show docs" })
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { silent = true, noremap = true, desc = "Lsp go definition" })
vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, { silent = true, noremap = true, desc = "Lsp show references" })
vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { silent = true, noremap = true, desc = "Lsp format file" })
vim.keymap.set({"n", "v"}, "<Leader>ca", vim.lsp.buf.code_action, { silent = true, noremap = true, desc = "Lsp show code actions" })
vim.keymap.set("n", "<C-d>", vim.diagnostic.open_float, { silent = true, noremap = true, desc = "Show diagnostic" })

-- Plugins keymaps
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { silent = true, noremap = true, desc = "File explorer" })
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { silent = true, noremap = true, desc = "Search files in directory" })
vim.keymap.set("n", "<Leader>F", ":Telescope<CR>", { silent = true, noremap = true, desc = "Search" })
vim.keymap.set("n", "<Leader>ff", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true, noremap = true, desc = "Search in file" })
vim.keymap.set("n", "<Leader>fs", ":Telescope live_grep<CR>", { silent = true, noremap = true, desc = "Search in directory" })
vim.keymap.set("n", "<Leader>fl", ":Telescope find_files<CR>", { silent = true, noremap = true, desc = "Search files in directory" })
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", { silent = true, noremap = true, desc = "Search buffers" })
vim.keymap.set("n", "<Leader>fg", ":Telescope git_status<CR>", { silent = true, noremap = true, desc = "Git status" })
vim.keymap.set("n", "<Leader>fp", ":NeovimProjectHistory<CR>", { silent = true, noremap = true, desc = "Projects directories" })
vim.keymap.set("n", "<Leader>w", ":WinShift<CR>", { silent = true, noremap = true, desc = "Move window" })
vim.keymap.set("n", "<Leader>r", ":Registers<CR>", { silent = true, noremap = true, desc = "Registers" })
vim.keymap.set("n", "<Leader>`", ":ToggleTerm direction=horizontal<CR>", { silent = true, noremap = true, desc = "Terminal" })
vim.keymap.set("n", "<Leader>m", ":TSJToggle<CR>", { silent = true, noremap = true, desc = "Expand block of code" })
vim.keymap.set("n", "<Leader>M", ":lua require('treesj').toggle({ split = {recursive = true} })<CR>", { silent = true, noremap = true, desc = "Expand all blocks" })
vim.keymap.set("n", "<Leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true, noremap = true, desc = "Harpoon menu" })
vim.keymap.set("n", "<Leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { silent = true, noremap = true, desc = "Harpoon add" })
vim.keymap.set("n", "<Leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", { silent = true, noremap = true, desc = "Harpoon next" })
vim.keymap.set("n", "<Leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", { silent = true, noremap = true, desc = "Harpoon prev" })
vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>", { silent = true, noremap = true, desc = "Zen mode" })
vim.keymap.set("n", "<Leader>u", ":lua require('undotree').toggle()<CR>", { silent = true, noremap = true, desc = "Undo history" })
vim.keymap.set("n", "<Leader>s", ":lua require('spectre').toggle()<CR>", { silent = true, noremap = true, desc = "Search and replace" })
vim.keymap.set("n", "<Leader>Ghp", ":Gitsigns preview_hunk<CR>", { silent = true, noremap = true, desc = "Git preview hunk" })
vim.keymap.set("n", "<Leader>Ghr", ":Gitsigns reset_hunk<CR>", { silent = true, noremap = true, desc = "Git reset hunk" })
vim.keymap.set("n", "<Leader>Ghs", ":Gitsigns stage_hunk<CR>", { silent = true, noremap = true, desc = "Git stage hunk" })
vim.keymap.set("n", "<Leader>xx", ":Trouble diagnostics toggle<CR>", { silent = true, noremap = true, desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<Leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", { silent = true, noremap = true, desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<Leader>cs", ":Trouble symbols toggle focus=false<CR>", { silent = true, noremap = true, desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<Leader>cl", ":Trouble lsp toggle focus=false win.position=right<CR>", { silent = true, noremap = true, desc = "LSP Definitions (Trouble)" })
vim.keymap.set("n", "<Leader>?", ":lua require('which-key').show({keys='<Leader>'})<CR>", { silent = true, desc = "Show keymaps" })

-- resize windows
vim.keymap.set("n", "<A-Left>", ":lua require('smart-splits').resize_left()<CR>", { silent = true, noremap = true, desc = "Resize window left" })
vim.keymap.set("n", "<A-Down>", ":lua require('smart-splits').resize_down()<CR>", { silent = true, noremap = true, desc = "Resize window down" })
vim.keymap.set("n", "<A-Up>", ":lua require('smart-splits').resize_up()<CR>", { silent = true, noremap = true, desc = "Resize window up" })
vim.keymap.set("n", "<A-Right>", ":lua require('smart-splits').resize_right()<CR>", { silent = true, noremap = true, desc = "Resize window right" })
-- moving between splits
vim.keymap.set("n", "<C-h>", ":lua require('smart-splits').move_cursor_left()<CR>", { silent = true, noremap = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", ":lua require('smart-splits').move_cursor_down()<CR>", { silent = true, noremap = true, desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", ":lua require('smart-splits').move_cursor_up()<CR>", { silent = true, noremap = true, desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", ":lua require('smart-splits').move_cursor_right()<CR>", { silent = true, noremap = true, desc = "Move to right window" })
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", ":lua require('smart-splits').swap_buf_left()<CR>", { silent = true, noremap = true, desc = "Swap buffer left" })
vim.keymap.set("n", "<leader><leader>j", ":lua require('smart-splits').swap_buf_down()<CR>", { silent = true, noremap = true, desc = "Swap buffer down" })
vim.keymap.set("n", "<leader><leader>k", ":lua require('smart-splits').swap_buf_up()<CR>", { silent = true, noremap = true, desc = "Swap buffer up" })
vim.keymap.set("n", "<leader><leader>l", ":lua require('smart-splits').swap_buf_right()<CR>", { silent = true, noremap = true, desc = "Swap buffer right" })

-- Navigation between terminal and windows
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
