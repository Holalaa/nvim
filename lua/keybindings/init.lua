local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name - rút gọn tên hàm 
local map = vim.api.nvim_set_keymap

 -- Remap space as leder key 
 map("", "<Space>", "<Nop>", opts)
 vim.g.mapleader = " "
 vim.g.maplocalleader = " "


-- Better window navigation
map('n', '<C-h>', '<C-w>h',opts)
map('n', '<C-j>', '<C-w>j',opts)
map('n', '<C-k>', '<C-w>k',opts)
map('n', '<C-l>', '<C-w>l',opts)

-- Map jk or kj to escape in insert mode
map('i', 'jk', '<ESC>', opts )
map('i', 'kj', '<ESC>',opts )
-- Makes indentation better
map('v', '<', '<gv', opts )
map('v', '>', '>gv', opts)

--  Navigate Buffers
map('n', '<S-l>', ':bnext<cr>',opts )
map('n', '<S-h>', ':bprevious<cr>',opts )

-- Move Text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Resize with arrow
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)


