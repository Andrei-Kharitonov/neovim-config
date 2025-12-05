-- File explorer
return {
  "nvim-mini/mini.files",
  version = "*",
  config = function()
    local MiniFiles = require("mini.files")

    -- Toggle dotfiles function
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
      MiniFiles.refresh({ content = { filter = new_filter } })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
      end,
    })

    -- Rounded corners
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesWindowOpen",
      callback = function(args)
        local win_id = args.data.win_id
        local config = vim.api.nvim_win_get_config(win_id)
        config.border = "rounded"
        vim.api.nvim_win_set_config(win_id, config)
      end,
    })

    -- Open files in split function
    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. " split")
          return vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target)
        MiniFiles.go_in({ close_on_file = true })
      end

      local desc = "Split " .. direction
      vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, "<Leader>v", "belowright vertical")
        map_split(buf_id, "<Leader>V", "belowright horizontal")
        map_split(buf_id, "<C-t>", "tab")
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
        go_in = "L",
        go_in_plus = "l",
        go_out = "H",
        go_out_plus = "h",
        synchronize = "<CR>",
      },
    })
  end,
}
