return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Add the language servers you want to use here
        tsserver = {
          settings = {
            typescript = {
              format = {
                enable = true,
              },
            },
            javascript = {
              format = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
    },
  },
}
