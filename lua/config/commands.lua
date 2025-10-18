-- Delete all hidden buffers
vim.api.nvim_create_user_command('DelHiddenBufs', function ()
  local bufinfos = vim.fn.getbufinfo({buflisted = true})
  local counter = 0
  vim.tbl_map(function (bufinfo)
    if bufinfo.changed == 0 and (not bufinfo.windows or #bufinfo.windows == 0) then
      vim.api.nvim_buf_delete(bufinfo.bufnr, {force = false, unload = false})
      counter = counter + 1
    end
  end, bufinfos)
  print(('%d buffers deleted'):format(counter))
end, { desc = 'Wipeout all buffers not shown in a window'})

-- Disable autocommenting new line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})