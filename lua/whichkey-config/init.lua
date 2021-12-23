local wk = require('which-key') 
local mappings = { 
  q = {":q<cr>", "Quit"}, 
  Q = {":wq<cr>", "Save & Quit"}, 
  w = {":w<cr>", "Save"}, 
  x = {":bdelete<cr>", "Close Buffer"}, 
  e = {":NvimTreeToggle<cr>", "Open File Explorer"},
  E = {":e ~/.config/nvim/init.lua<cr>", "Edit Config File"}, 
  
  f = {
    name = "Telescope",
    f = {"<cmd>Telescope find_files<cr>", "Find Files"},
    r = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
    b = {"<cmd>Telescope buffers<cr>", "Buffers"},
    o = {"<cmd>Telescope oldfiles<cr>", "Recent Files"},
  },
  ['/'] = {":CommentToggle<cr>", "Toggle Comment"} 
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
