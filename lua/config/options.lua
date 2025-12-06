-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.shortmess = "ltToOCFsS"
vim.opt.showbreak = "↪ "
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

vim.g.mapleader = " " -- <Leader> = <Space>
vim.g.maplocalleader = "\\"

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
  float = {
    border = "rounded",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.ERROR] = " ",
    },
  },
})
