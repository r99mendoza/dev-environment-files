return {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all other start plugins
    config = function()
        local tokyonight = require("tokyonight")

        tokyonight.setup({
            style = "night",
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                functions = { italic = false },
            }
        })
        vim.cmd([[colorscheme tokyonight-night]])
    end
}
