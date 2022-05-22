--#region
local opts = { silent = true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


--#endregion

vim.keymap.set("n", "İ", "I", { remap = true })

vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", {})

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-N>", {})



vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true })
