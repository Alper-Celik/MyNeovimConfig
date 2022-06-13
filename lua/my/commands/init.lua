vim.api.nvim_create_user_command("EX", "e %:h", {})
vim.api.nvim_create_user_command("SETCWD","cd %:h",{})
vim.api.nvim_create_user_command("Reload","luafile $MYVIMRC",{})

