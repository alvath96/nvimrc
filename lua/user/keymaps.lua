local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap "," as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Remap <C-c> to <Esc>
keymap("", "<C-c>", "<Esc>", opts)

-- Telescope
keymap("", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("", "<C-f>", ":Telescope live_grep<CR>", opts)

-- NvimTree
keymap("", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- TODO: I don't really use splits but this is really important to set
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows

-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap("n", "<C-j>", ":bnext<CR>", opts)
keymap("n", "<C-k>", ":bprevious<CR>", opts)
keymap("n", "<Leader>q", ":Bdelete<CR>", opts)
keymap("n", "<Leader>q!", ":Bdelete!<CR>", opts)

-- always paste to new line
keymap("n", "gp", "o<Esc>p", opts) -- next line
keymap("n", "gP", "O<Esc>p", opts) -- previous line

-- Move text up and down
keymap("n", "J", "<Esc>:m .+1<CR>==", opts)
keymap("n", "K", "<Esc>:m .-2<CR>==", opts)

-- yank Y acts like D and C
keymap("n", "Y", "y$", opts)

-- commment stuff
keymap("n", "<CR>", "gcc", {silent = true})

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

-- commment stuff
keymap("v", "<CR>", "gcgv", {silent = true})

-- Terminal --
local term_opts = { silent = true }
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)           -- Esc to exit terminal mode
keymap("t", "<C-d>", "<Esc>:Bdelete!<CR>", term_opts)    -- Ctrl-D to exit terminal

-- TODO C-w to delete word backwards
-- keymap("t", "<C-w>", term_sendkeys('', "\<C-w>"), term_opts)    -- Ctrl-D to exit terminal
--
vim.cmd[[
  augroup term_behaviour
    autocmd TermOpen * startinsert
    autocmd TermClose * stopinsert
  augroup end
]]

-- TODO Better terminal navigation
keymap("t", "<C-w><C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-w><C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-w><C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-w><C-l>", "<C-\\><C-N><C-w>l", term_opts)

