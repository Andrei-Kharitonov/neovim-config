return {
  {
    -- Searcher
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      local fb_actions = require "telescope".extensions.file_browser.actions
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              width = 0.8,
              height = 0.8,
              preview_cutoff = 60,
              prompt_position = "top",
            },
          },
          mappings = {
            i = {
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-h>"] = "preview_scrolling_up",
              ["<C-l>"] = "preview_scrolling_down",
              ["<C-q>"] = "close",
            },
            n = {
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-h>"] = "preview_scrolling_up",
              ["<C-l>"] = "preview_scrolling_down",
              ["q"] = "close",
            },
          },
        },
        extensions = {
          file_browser = {
            display_stat = false,
            dir_icon = "",
            grouped = true,
            dir_icon_hl = "Directory",
            hide_parent_dir = true,
            mappings = {
              ["n"] = {
                ["<BS>"] = fb_actions.goto_parent_dir,
                ["H"] = fb_actions.toggle_hidden,
                ["."] = fb_actions.toggle_hidden,
                ["h"] = false,
                ["g"] = false,
              },
              ["i"] = {
                ["<C-.>"] = fb_actions.toggle_hidden,
              },
            },
          },
        },
      })
      require("telescope").load_extension("notify")
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    -- Window for code actions
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },

  {
    -- Telescope file browser
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  }
}
