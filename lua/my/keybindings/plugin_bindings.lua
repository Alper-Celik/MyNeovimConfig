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
        direction =  "float",
    })
