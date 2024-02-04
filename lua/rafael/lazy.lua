local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ {import = "rafael.plugins" }, {import = "rafael.plugins.lsp" } }, {
    root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "tokyonight" },
    },
    checker = {
        enabled = true, -- automatically check for plugin updates
        notify = false, -- get a notification when new updates are found
    },
    change_detection = {
        enabled = true, -- automatically check for config file changes and reload the ui
        notify = false, -- get a notification when changes are found
    },
})
