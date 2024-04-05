local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

keymap("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode with jk"})
keymap("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })

-- Remapping v -> V and V -> v
keymap("n", "v", "V", opts)
keymap("n", "V", "v", opts)
keymap("n", "e", ":e<space>", { desc = "Toggle file open" })
keymap("n", "<leader>it", ":IBLToggle<cr>", { noremap = true, silent = true, desc = "Toggle indent lines" })
keymap("n", "<leader>w", ":set wrap<cr>", { noremap = true, silent = true, desc = "Enable line wrap" })
keymap("n", "<leader>nw", ":set nowrap<cr>", { noremap = true, silent = true, desc = "Disable line wrap" })
keymap("n", "<leader>s", ":write<CR>", { desc = "Save changes to file" })
keymap("n", "<leader>zm", ":ZenMode<CR>", { noremap = true, silent = true, desc = "Toggle Zen Mode" })
keymap("n", "<leader>wsq", 'ysiw"', { desc = "Word Surround Quotes" })

-- Stay in indent mode in visual line mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Navigate buffers
keymap("n", "<C-j>", ":bnext<CR>", opts)
keymap("n", "<C-k>", ":bprevious<CR>", opts)

-- splits
keymap("n", "<leader>v", ":vsplit<cr>", opts)

-- Better Window Navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
