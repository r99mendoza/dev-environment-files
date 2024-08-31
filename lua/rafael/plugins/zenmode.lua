return {
  "folke/zen-mode.nvim",
  enable = true,
  opts = {
    plugins = {
      tmux = { enabled = false }, -- disables the tmux statusline
      -- this will change the font size on kitty when in zen mode
      -- to make this work, you need to set the following kitty options:
      -- - allow_remote_control socket-only
      -- - listen_on unix:/tmp/kitty
      kitty = {      -- Kovid Goyal kitty
        enabled = false,
        font = "+4", -- font size increment
      },
    },
  }
}
