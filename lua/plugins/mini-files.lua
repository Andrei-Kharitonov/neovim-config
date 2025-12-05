-- File explorer
return {
  "nvim-mini/mini.files",
  version = "*",
  config = function()
    local show_dotfiles = false
    local filter_show = function(_)
      return true
    end

    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, ".") and not vim.startswith(fs_entry.name, "node_modules")
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      require("mini.files").refresh({ content = { filter = new_filter } })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesWindowOpen",
      callback = function(args)
        local win_id = args.data.win_id
        local config = vim.api.nvim_win_get_config(win_id)
        config.border = "rounded"
        vim.api.nvim_win_set_config(win_id, config)
      end,
    })

    require("mini.files").setup({
      content = {
        filter = filter_hide,
      },
      windows = {
        max_number = 3,
        preview = true,
        width_focus = 45,
        width_preview = 45,
        width_nofocus = 20,
      },
      mappings = {
        go_in       = 'L',
        go_in_plus  = 'l',
        go_out      = 'H',
        go_out_plus = 'h',
        synchronize = '<CR>',
      },
    })
  end,
}
