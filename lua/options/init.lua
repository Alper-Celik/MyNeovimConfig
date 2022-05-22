local set = vim.opt
set.mouse = "a"
set.wrap = false

set.number = true
vim.api.nvim_create_autocmd({"TermOpen"},{pattern = "*", callback = function ()
	vim.opt_local.number =false;
end })

set.completeopt:remove("preview")
