vim.g.mapleader = " "
vim.keymap.set("n", "U", ":redo<CR>")


vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-i>', '<C-i>', { noremap = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "H", "<cmd>tabprev<CR>")
vim.keymap.set("n", "L", "<cmd>tabnext<CR>")
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-w>h', '<C-w>s')
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tN', ':-tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>te', ':tabe ', { noremap = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
vim.keymap.set('n', '<C-n>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "<leader>q", ":botright copen<cr>")
vim.keymap.set("n", "q", function()
    if vim.fn.reg_recording() ~= "" then
        return "q"
    end
    if vim.bo.filetype == "qf" then
        return ":close<CR>"
    end
    return "q"
end, { expr = true, silent = true })

vim.keymap.set({ "n", "v" }, "d", "\"_d")
vim.keymap.set({ "n", "v" }, "D", "\"_D")
vim.keymap.set({ "n", "v" }, "S", "\"_S")
vim.keymap.set({ "n", "v" }, "s", "\"_s")
vim.keymap.set({ "n", "v" }, "c", "\"_c")
vim.keymap.set({ "n", "v" }, "C", "\"_C")
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>', { desc = 'List buffers' })


vim.keymap.set({ "n", "x", "o" }, "$", "g_")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "Jk", "<Esc>")
vim.keymap.set("i", "jK", "<Esc>")
vim.keymap.set("i", "JK", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "JK", "<Esc>")
vim.keymap.set("i", "<C-v>", "<C-c>pi")
vim.keymap.set("i", "<C-V>", "<C-c>Pi")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

vim.keymap.set("x", "<Tab>", ">gv")
vim.keymap.set("x", "<S-Tab>", "<gv")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")


vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
