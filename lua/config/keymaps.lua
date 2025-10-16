-- Keymaps
vim.g.mapleader = " " -- map <Leader> key
vim.g.maplocalleader = "\\"
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("n", "<Leader>/", ":noh<CR>", { silent = true })
-- buffers
vim.keymap.set("n", "<Leader>bd", ":BufDel<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bh", ":DelHiddenBufs<CR>", { silent = true })
-- copy, pasete, cut
vim.keymap.set("v", "<C-c>", "\"+y", { silent = true })
vim.keymap.set("i", "<C-v>", "<C-r>+", { silent = true })
vim.keymap.set("v", "<C-x>", "\"+d", { silent = true })

-- Plugins keymaps
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { silent = true })
vim.keymap.set("n", "<Leader>t", ":Telescope<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ff", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fs", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fl", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fg", ":Telescope git_status<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fp", ":NeovimProjectHistory<CR>", { silent = true })
vim.keymap.set("n", "<Leader>w", ":WinShift<CR>", { silent = true })
vim.keymap.set("n", "<Leader>r", ":Registers<CR>", { silent = true })
vim.keymap.set("n", "<Leader>`", ":ToggleTerm direction=horizontal<CR>", { silent = true })
vim.keymap.set("n", "<Leader>m", ":TSJToggle<CR>", { silent = true })
vim.keymap.set("n", "<Leader>M", ":lua require('treesj').toggle({ split = {recursive = true} })<CR>", { silent = true })
vim.keymap.set("n", "<Leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>", { silent = true })
vim.keymap.set("n", "<Leader>u", ":lua require('undotree').toggle()<CR>", { silent = true })

-- Navigation between terminal and windows
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
