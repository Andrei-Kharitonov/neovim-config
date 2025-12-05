-- Display images in buffers
return {
  "3rd/image.nvim",
  build = false,
  event = "VeryLazy",
  config = function()
    require("image").setup({
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          download_remote_images = false,
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = "popup",
          floating_windows = true,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width_window_percentage = 80,
      max_height_window_percentage = 80,
      -- ignore virtual url in mini.files preview
      hijack_file_patterns = { "%.png$", "%.jpg$", "%.jpeg$", "%.gif$", "%.webp$", "%.avif$" }
    })
  end,
}
