-- Fast navigation
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      multi_window = false,
    },
    label = {
      min_pattern_length = 1,
    },
    prompt = {
      prefix = { { "=", "FlashPromptIcon" } },
    },
    modes = {
      char = {
        enabled = false,
      },
    },
  },
}
