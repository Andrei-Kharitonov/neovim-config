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

-- Sort buffers
vim.api.nvim_create_user_command("BufferLineSortById", function ()
  require("bufferline").sort_by(function (buffer_a, buffer_b)
    return buffer_a.id < buffer_b.id
  end)
end, { desc = "Sort buffers in bufferline" })

-- Grapple buffers first, other sorted by id
vim.api.nvim_create_user_command("BufferLineSortByGrapple", function()
    local bufferline = require("bufferline")
    local grapple = require("grapple")

    bufferline.sort_by(function(buffer_a, buffer_b)
      local index_a = grapple.name_or_index({ buffer = buffer_a.id })
      local index_b = grapple.name_or_index({ buffer = buffer_b.id })

      if index_a ~= nil and index_b ~= nil then
        return index_a < index_b
      elseif index_a ~= nil and index_b == nil then
        return true
      elseif index_a == nil and index_b ~= nil then
        return false
      elseif buffer_a or buffer_b then
        return buffer_a.id < buffer_b.id
      else
        return true
      end
    end)
end, { desc = "Sort buffers in bufferline" })

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufAdd", "BufEnter" }, {
  pattern = "*.lua",
  callback = function ()
    if #vim.api.nvim_list_bufs() > 0 then
      vim.cmd("BufferLineSortByGrapple")
    end
  end
})
