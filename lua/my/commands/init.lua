vim.api.nvim_create_user_command("EX", "e %:h", {})
vim.api.nvim_create_user_command("CD", "cd %:h", {})
vim.api.nvim_create_user_command("Reload", function()
    require("plenary.reload").reload_module("my")
    vim.cmd("luafile $MYVIMRC")
end, {})

