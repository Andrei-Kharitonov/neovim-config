-- Delete all hidden buffers
vim.api.nvim_create_user_command("DelHiddenBufs", function()
  local bufinfos = vim.fn.getbufinfo({ buflisted = true })
  local counter = 0
  vim.tbl_map(function(bufinfo)
    if bufinfo.changed == 0 and (not bufinfo.windows or #bufinfo.windows == 0) then
      vim.api.nvim_buf_delete(bufinfo.bufnr, { force = false, unload = false })
      counter = counter + 1
    end
  end, bufinfos)
  print(("%d buffers deleted"):format(counter))
end, { desc = "Wipeout all buffers not shown in a window" })

-- Disable autocommenting new line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Toggle soft wrap
vim.api.nvim_create_user_command("WrapToggle", function()
  ---@diagnostic disable-next-line: undefined-field
  local wrap = vim.opt_local.wrap:get()

  if wrap then
    vim.opt_local.wrap = false
    vim.opt_local.linebreak = false
    vim.opt_local.breakindent = false
  else
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end
end, { desc = "Toggle soft wrap" })

-- Toggle vertical line
vim.api.nvim_create_user_command("VerticalLineToggle", function()
  ---@diagnostic disable-next-line: undefined-field
  local cc = vim.opt_local.colorcolumn:get()

  if #cc == 0 then
    vim.opt_local.colorcolumn = "78"
  else
    vim.opt_local.colorcolumn = ""
  end
end, { desc = "Toggle vertical line" })

-- Wrap lines in .md, .txt
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.md", "*.txt" },
  callback = function()
    ---@diagnostic disable-next-line: undefined-field
    if not vim.opt_local.wrap:get() then
      vim.cmd("WrapToggle")
    end
  end,
})
