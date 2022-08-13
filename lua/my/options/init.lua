local set = vim.opt

--mouse support
set.mouse = "a"

--no wrap
set.wrap = false

--line numbers
set.number = true
set.relativenumber =true

--no line numbers in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, { pattern = "*", callback = function()
    vim.opt_local.number = false;
end })

--remove preview window
set.completeopt:remove("preview")

--clipboard sync
set.clipboard:append("unnamedplus")

--max 20 items at the same time in complete
set.pumheight = 20


--use whitespaces instead of tabs
set.expandtab = true

set.shiftwidth = 4
set.tabstop = 4

set.autoindent = true
set.smartindent = true


--#region
set.guifont = "JetBrains Mono:h10"


