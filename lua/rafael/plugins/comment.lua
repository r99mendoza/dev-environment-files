return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    --dependencies = {
        -- "JoosepAlviste/nvim-ts-context-commentstring", -- optional, only for tsx and jsx files
    --},
    config = function()
        local comment = require("Comment")
        -- optional, only for tsx and jsx files
        -- local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

        -- enable comment
        comment.setup({
            -- for commenting tsx and jsx files (optional)
            -- pre_hook = ts_context_commentstring.create_pre_hook(),
        })
    end
}
