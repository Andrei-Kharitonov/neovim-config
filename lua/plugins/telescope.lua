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
      })
      require("telescope").load_extension("notify")
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
}
