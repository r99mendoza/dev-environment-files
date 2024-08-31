return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000, -- make sure to load this before all other start plugins
    config = function()
      local tokyonight = require("tokyonight")

      tokyonight.setup({
        style = "moon",
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
          sidebars = "transparent",
          floats = "transparent",
        },
        dim_inactive = true, -- dims inactive windows
      })
      vim.cmd([[colorscheme tokyonight]])
    end
  }
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   enabled = true,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all other start plugins
  --   config = function()
  --     local catppuccin = require("catppuccin")
  --
  --     catppuccin.setup({
  --       flavour = "mocha", -- latte, frappe, macchiato, mocha
  --       no_italic = false,
  --       no_bold = false,
  --       no_underline = false,
  --     })
  --     vim.cmd([[colorscheme catppuccin]])
  --     -- Enabling undercurl
  --     -- vim.cmd([[highlight DiagnosticUnderlineError guisp='Red' gui=undercurl]])
  --     -- vim.cmd([[highlight DiagnosticUnderlineWarn guisp='Cyan' gui=undercurl]])
  --   end
  -- }
  -- {
  --     "EdenEast/nightfox.nvim",
  --     enabled = true,
  --     priority = 1000,
  --     config = function()
  --         local nightfox = require("nightfox")
  --         nightfox.setup({
  --             options = {
  --                 styles = {
  --                     comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
  --                     keywords = "bold",
  --                     types = "italic,bold",
  --                 }
  --             }
  --         })
  --         vim.cmd([[colorscheme carbonfox]])
  --     end
  -- }
  -- {
  --     "rebelot/kanagawa.nvim",
  --     enabled = true,
  --     priority = 1000, -- make sure to load this before all other start plugins
  --     config = function()
  --         local kanagawa = require("kanagawa")
  --
  --         kanagawa.setup({
  --             undercurl = false,
  --             commentStyle = { italic = false },
  --             keywordStyle = { italic = false },
  --             theme = "wave",
  --         })
  --         vim.cmd([[colorscheme kanagawa-wave]])
  --     end
  -- }
  -- {
  --     "rose-pine/neovim",
  --     name = "rose-pine",
  --     enabled = true,
  --     priority = 1000,
  --     config = function()
  --         local rose_pine = require("rose-pine")
  --         rose_pine.setup({
  --             variant = "auto", -- auto, main, moon, or dawn
  --             dark_variant = "main", -- main, moon, or dawn
  --
  --             styles = {
  --                 bold = true,
  --                 italic = false,
  --                 transparency = false,
  --             },
  --         })
  --         vim.cmd([[colorscheme rose-pine]]) -- rose-pine-main, rose-pine-moon, rose-pine-dawn
  --     end
  -- }
}
