return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- lua = { "stylua" },
        -- json = { "prettier" },
        -- yaml = { "prettier" },
        -- html = { "prettier" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_format = "fallback",
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
