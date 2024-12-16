vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "j", "jzz", {noremap = true,  silent = true})
keymap.set("n", "k", "kzz", {noremap = true, silent = true})


keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")


keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>to", ":tabnew<CR>") -- leader tab open
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- leader tab exit
keymap.set("n", "<leader>tn", ":tabn<CR>") -- leader tab next
keymap.set("n", "<leader>tp", ":tabp<CR>") -- leader tab previous

--visual mode
keymap.set('v', 'L', '$', { noremap = true, silent = true })
keymap.set('v', 'H', '^', { noremap = true, silent = true })
keymap.set('v', 'O', '%', { noremap = true, silent = true })


--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--nvim tree
keymap.set("n","<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") 

keymap.set("n", "L", "$")
keymap.set("n", "H", "^")
keymap.set("n", "O", "%")


--buffers
vim.keymap.set("n", "<leader>q", function()
  local buffers = vim.fn.getbufinfo({buflisted = 1}) -- Lấy danh sách các buffer đang mở
  if #buffers > 1 then
    vim.cmd("bprev") -- Chuyển sang buffer trước
  end
  vim.cmd("bd!") -- Đóng buffer hiện tại
end, { noremap = true, silent = true })


--move with buffers 
keymap.set('n', '<Leader>.', ':bnext<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>,', ':bprev<CR>', { noremap = true, silent = true }) 
keymap.set('n', '<Leader>-', ':bd!<CR>', { noremap = true, silent = true })

--move code
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })


keymap.set("x", "<leader><leader>", "<Esc>", { noremap = true, silent = true })
keymap.set("v", "<leader><leader>", "<Esc>", { noremap = true, silent = true })

--replace character
vim.api.nvim_set_keymap("n", '<leader>sr', ":%s//", {noremap = true, silent = true})

keymap.set('x', '<leader>t','>gv', { noremap = true, silent = true })
