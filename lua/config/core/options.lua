local options = {
  cmdheight = 1,          -- more space in the neovim command line for displaying messages
  encoding = "utf-8",     -- handles things like table lines
  fileencoding = "utf-8", -- the encoding written to a file
  tabstop = 4,            -- insert 4 spaces for a tab
  softtabstop = 4,
  shiftwidth = 4,         -- the number of spaces inserted for each indentation
  expandtab = true,       -- In Insert mode: convert tabs to spaces
  autoindent = true,
  foldlevel = 99,
  startofline = false, -- When "on", certain cmds, such as gg and G, move the cursor to the first non-blank of the line.
  hidden = true,       -- allows you to move around files quickly w/out worrying about whether they're written to disk
  mouse = "",          -- allow the mouse to be used in neovim
  mousefocus = true,
  mousehide = true,
  mousemodel = "extend",
  mousemoveevent = true,
  textwidth = 130,
  backspace = "indent,eol,start", -- allow backspace on indent, end of line or insert mode start position
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  hlsearch = true,                -- highlight all matches on previous search pattern
  ignorecase = true,              -- ignore case in search patterns
  smartcase = true,               -- smart case
  incsearch = true,               -- makes search interactive
  smartindent = true,             -- make indenting smarter again
  pumheight = 10,                 -- pop up menu height
  showmode = false,               -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                -- always show tabs
  scrolloff = 999,                -- Keep cursor centered vertically
  cursorline = true,              -- highlight the current line
  termguicolors = true,           -- set term gui colors to enable highlight groups (most terminals support this)
  swapfile = true,                -- creates a swapfile
  backup = false,                 -- creates a backup file
  writebackup = false,            -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- directory = "/tmp/$USER/vim",            -- list of dir names for the swap file
  -- undodir = "/tmp/$USER/vim/undodir",       -- list of dir names for undo files
  undofile = false,               -- enable persistent undo
  wildmenu = true,
  wildmode = "longest:full,full", -- Better control over file name completion when using :e <file>
  timeoutlen = 1000,              -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,               -- faster completion (4000ms default)
  number = true,                  -- set numbered lines
  relativenumber = true,          -- set relative numbered lines
  numberwidth = 2,                -- set number column width to 2 {default 4}
  signcolumn = "yes",             -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                    -- display lines as one long line
  splitright = true,              -- split vertical window to the right
  splitbelow = true,              -- split horizontal window to the bottom
  regexpengine = 0,
  lazyredraw = true,
  synmaxcol = 1200, -- Maximum column in which to search for syntax items
  viewoptions = "folds,cursor",
  sessionoptions = "folds",
  cpoptions = "ceFs", -- Compatibility (with vi) options (':h cpo' for more info)
  sidescrolloff = 8,
}

-- Note: vim.opt:remove()
-- Remove a value from string-style options. See ":h set-="
-- These are equivalent:
-- vim.opt.wildignore:remove("*.pyc")
-- vim.opt.wildignore = vim.opt.wildignore - "*.pyc"

vim.opt.shortmess:append("at")
vim.opt.formatoptions:remove("t")
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Figure out the system Python for Neovim.
if vim.fn.exists("$VIRTUAL_ENV") then
  vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system("/bin/which -a python3 | head -n1"), "\n", "", "g")
else
  vim.g.python3_host_prog = "$HOME/envs/python3.13.3/bin/python3"
end

-- vim.g.node_host_prog = "/bin/node"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Jump to the last position when reopening a file
local group = vim.api.nvim_create_augroup("jump_to_last_position", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function(args)
    local line = vim.fn.line
    local valid_line = line([['"]]) >= 1 and line([['"]]) <= line("$")
    local not_commit = vim.b[args.buf].filetype ~= 'commit' -- ~= means not equal to

    if valid_line and not_commit then
      vim.cmd([[normal! g`"zz]])
    end
  end
})

-- Undercurl
vim.cmd([[highlight DiagnosticUnderlineError guisp='Red' gui=undercurl]])
vim.cmd([[highlight DiagnosticUnderlineWarn guisp='Cyan' gui=undercurl]])
