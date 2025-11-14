-- Fast navigation
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      multi_window = false,
    },
    label = {
      min_pattern_length = 2,
    },
    prompt = {
      prefix = { { "=", "FlashPromptIcon" } },
    },
  },
}
