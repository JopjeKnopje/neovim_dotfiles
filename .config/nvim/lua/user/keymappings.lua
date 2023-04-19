local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- set leader key
vim.g.mapleader = " "

-- compile script stuff
keymap("", "<leader>R", ":w | :!../compile.sh % <CR>", opts)
keymap("", "<leader>r", ":wa | :!make run <CR>", opts)
-- keymap("", "<leader>t", ":wa | :sp | :res 10 | :term norminette % <CR>", opts)


-- clear highlighting
keymap("", "<Esc><Esc>", ":let @/=''<CR>", opts)

-- nvim tree mappings
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bd<CR>", opts)

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- move selection
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)   

-- auto center when half-page jumping
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- center when searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- telescope mappings
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false}))<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files( { hidden = true }, require('telescope.themes').get_dropdown())<cr>", opts)

local tl_builtin = require('telescope.builtin')

-- vim.keymap.set('n', '<leader>f', tl_builtin.find_files, { layout_strategy='vertical' })

vim.keymap.set('n', '<leader>f', tl_builtin.find_files, {})
vim.keymap.set('n', '<leader>F', tl_builtin.git_files, {})
vim.keymap.set('n', '<leader>t', tl_builtin.live_grep, {})

keymap("n", "<leader>s", ":Telescope symbols <CR>", opts)
