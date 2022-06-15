--file explerer
require("nvim-tree").setup { git = {
    ignore = false,

}, view = {
    mappings = {
        custom_only = false,
        list = {
            { key = "<C-E>", action = "close" },
            { key = "l", action = "edit", action_cb = edit_or_open },
            { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
            { key = "h", action = "close_node" },
            { key = "H", action = "collapse_all", action_cb = collapse_all }
        }
    },
}, }


--terminal
require("toggleterm").setup(
    {
        size = 20,
        open_mapping = "<A-t>",
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        shell = vim.o.shell,
        direction = "float",
    })

--#region telescope
require "telescope".setup{}

local silent = {silent = true}

vim.keymap.set("n","ft",":Telescope builtin<cr>",silent);

vim.keymap.set("n","ff",":Telescope find_files<cr>",silent);
vim.keymap.set("n","fs",":Telescope live_grep<cr>",silent);

vim.keymap.set("n","fvb",":Telescope buffers<cr>",silent);
vim.keymap.set("n","fvh",":Telescope help_tags<cr>",silent);
vim.keymap.set("n","fvm",":Telescope keymap<cr>",silent);

vim.keymap.set("n","flr",":Telescope lsp_references<cr>",silent);
vim.keymap.set("n","fls",":Telescope lsp_document_symbols<cr>",silent);
vim.keymap.set("n","flws",":Telescope lsp_workspace_symbols<cr>",silent);


vim.keymap.set("n","fgc",":Telescope git_commits<cr>",silent);
vim.keymap.set("n","fgcb",":Telescope git_bcommits<cr>",silent);
vim.keymap.set("n","fgb",":Telescope git_branches<cr>",silent);
vim.keymap.set("n","fgs",":Telescope git_status<cr>",silent);
vim.keymap.set("n","fgt",":Telescope git_stash<cr>",silent);
--#endregion
