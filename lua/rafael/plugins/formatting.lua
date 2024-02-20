return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
        local conform = require("conform")
        
        conform.setup({
            formatters_by_ft = {
                python = { "black" },
                -- Conform will run multiple formatters sequentially
                lua = { "stylua" },
                --json = { "prettier" },
                --yaml = { "prettier" },
                -- Use a sub-list to run only the first available formatter
                --javascript = { { "prettierd", "prettier" } },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
            -- formatters = {
            --     black = {
            --         command = "black"
            --     }
            -- },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
