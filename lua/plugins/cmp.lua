return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim", -- Make sure this dependency is added
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        preselect = cmp.PreselectMode.None,
      })

      -- Extend the existing options
      opts = vim.tbl_deep_extend("force", opts, {
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            symbol_map = { Supermaven = "" },
          }),
        },
        mapping = vim.tbl_extend("force", opts.mapping or {}, {
          ["<Tab>"] = cmp.mapping(function(fallback)
            local suggestion = require("supermaven-nvim.completion_preview")
            if suggestion.has_suggestion() then
              suggestion.on_accept_suggestion()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      })

      return opts
    end,
  },
}
