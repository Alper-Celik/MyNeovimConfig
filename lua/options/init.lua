local set = vim.opt

--mouse support
set.mouse = "a"

--no wrap
set.wrap = false

--line numbers
set.number = true

--no line numbers in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, { pattern = "*", callback = function()
    vim.opt_local.number = false;
end })

--remove preview window
set.completeopt:remove("preview")

--use whitespaces instead of tabs
set.expandtab = true

set.shiftwidth = 4
set.tabstop = 4

set.autoindent = true
set.smartindent = true
