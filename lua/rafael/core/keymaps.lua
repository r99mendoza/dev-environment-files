local keymap = vim.api.nvim_set_keymap
keymap("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

keymap("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode with jk" })
keymap("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })
keymap("n", "<leader>s", ":write<CR>", { desc = "Save changes to file" })
keymap("n", "e", ":e<space>", { desc = "Toggle file open" })
keymap("n", "<leader>w", ":set wrap<cr>", { noremap = true, silent = true, desc = "Enable line wrap" })
keymap("n", "<leader>nw", ":set nowrap<cr>", { noremap = true, silent = true, desc = "Disable line wrap" })
keymap("n", "<leader>wsq", 'ysiw"', { desc = "Word Surround Quotes" })
keymap("n", "<leader>it", ":IBLToggle<cr>", { noremap = true, silent = true, desc = "Toggle indent lines" })
keymap("n", "<leader>zm", ":ZenMode<CR>", { noremap = true, silent = true, desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>ri", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Fill word under cursor" })

-- Remapping v -> V and V -> v
keymap("n", "v", "V", opts)
keymap("n", "V", "v", opts)

-- Stay in indent mode in visual line mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Navigate buffers
keymap("n", "<C-j>", ":bnext<CR>", opts)
keymap("n", "<C-k>", ":bprevious<CR>", opts)

-- window management
keymap("n", "<leader>v", ":vsplit<CR>", { desc = "Split window vertically" })
keymap("n", "<leader>h", ":split<CR>", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
