-- Snippets and autocompletions
return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local function cmp_or_placeholder_next(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end

      local function cmp_or_placeholder_prev(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(_, item)
            local max_abbr = 35
            local max_menu = 55
            if vim.fn.strchars(item.abbr) > max_abbr then
              item.abbr = vim.fn.strcharpart(item.abbr, 0, max_abbr - 1) .. "…"
            end
            if item.menu and vim.fn.strchars(item.menu) > max_menu then
              item.menu = vim.fn.strcharpart(item.menu, 0, max_menu - 1) .. "…"
            end
            return item
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            max_height = 15,
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
            max_height = 15,
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(cmp_or_placeholder_next, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(cmp_or_placeholder_prev, { "i", "s" }),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-l>"] = cmp.mapping.scroll_docs(4),
          ["<C-h>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
