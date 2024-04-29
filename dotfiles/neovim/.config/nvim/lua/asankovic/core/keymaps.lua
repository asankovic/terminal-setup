vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "U", "<C-r>", { desc = "Undo the latest undo"})

keymap.set("n", "zj", "o<ESC>k", { desc = "Insert an empty line below."})
keymap.set("n", "zk", "O<ESC>j", { desc = "Insert an empty line above."})

keymap.set("x", "<", "<gv", {desc = "Remove indent backwards while keeping selection."})
keymap.set("x", ">", ">gv", {desc = "Indent while keeping selection."})
keymap.set("x", "=", "=gv", {desc = "Format while keeping selection."})
keymap.set("n", "==", "gg<S-v>G", {desc = "Select everything"})

keymap.set("n", "<leader>ui", "~hi", {desc = "Toggle case under cursor and start typing."})
keymap.set("x", "<leader>ud", "d~h", {desc = "Remove selection and toggle case."})

keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Yank to system register"})
--keymap.set("n", "<silent> \"\"", ":registers \"0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>", {desc = "Toggle case under cursor and start typing."})

keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move selected line up."})
keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move selected line down."})

keymap.set("n", "J", "mzJ`z", {desc = "Join line without losing the cursor position"})

keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Scroll down keeping the screen aligned."})
keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Scroll up keeping the screen aligned."})
keymap.set("n", "n", "nzzzv", {desc = "Keep the selection in the middle of the screen."})
keymap.set("n", "N", "Nzzzv", {desc = "Keep the selection in the middle of the screen."})

keymap.set("n", "Q", "<nop>", {desc = "Nope."})
keymap.set("n", "QQ", "<cmd>q!<CR>", {desc = "Force quit."})
keymap.set("n", "WW", "<cmd>w!<CR>", {desc = "Force save."})
keymap.set("n", "WQ", "<cmd>wqa<CR>", {desc = "Save all and exit nvim."})

keymap.set("n", "<C-]>", ":vertical resize -10<CR>", {desc = "Reduce size of vertical split."})
keymap.set("n", "<C-[>", ":vertical resize +10<CR>", {desc = "Expand size of vertical split."})

keymap.set('n', '<space>h', "<cmd>set nohlsearch<CR>", {desc = "Turn off search result highlighting"})
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })
keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>", {desc = "Dismiss Noice Message"})
