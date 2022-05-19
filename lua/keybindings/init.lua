vim.keymap.set("n", "İ", "I", { remap = true })

vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", {})

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-N>", {})


vim.keymap.set("n", "<C-E>", ":NvimTreeToggle<CR>", { silent = true })
