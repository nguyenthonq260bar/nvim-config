vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "j", "jzz", {noremap = true,  silent = true})
keymap.set("n", "k", "kzz", {noremap = true, silent = true})

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>") -- leader tab open
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- leader tab exit
keymap.set("n", "<leader>tn", ":tabn<CR>") -- leader tab next
keymap.set("n", "<leader>tp", ":tabp<CR>") -- leader tab previous

--plugins keymaps

--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--nvim tree
keymap.set("n", "<leader>em", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffersk<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") 
