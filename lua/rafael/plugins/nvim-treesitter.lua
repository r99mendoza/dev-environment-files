return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    -- dependencies not really needed, can delete
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = { -- enable syntax highlighting
                enable = true,
                disable = { "verilog" },
            },
            indent = { enable = true },
            auto_install = true, -- Set false if no internet.
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = { enable = true },
            -- ensure these language parsers are installed
            ensure_installed = {
                "python",
                "bash",
                "yaml",
                "json",
                "lua",
                "html",
                "vim",
                "gitignore",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })

        -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx (I DON'T THINK I NEED THIS)
        -- require('ts_context_commentstring').setup {}
    end,
}
