return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        
        lint.linters_by_ft = {
            python = { "ruff" },
        }

        -- try linting when we enter a buffer, when we write to the buffer, or we exit insert mode
        -- ruff has 'stdin = true', so the file does not have to be saved for linting to work.
        -- pylint has 'stdin = false', so InsertLeave and TextChanged won't work
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end
}
