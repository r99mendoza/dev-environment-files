return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  -- dependencies = {
  --   "windwp/nvim-ts-autotag",
  -- },
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
      -- autotag = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "cpp",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "make",
        "python",
        "ruby",
        "tcl",
        "tmux",
        "toml",
        "verilog",
        "vim",
        "vimdoc",
        "yaml",
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
  end,
}
