-- Used to manage specific keymap for nvim-daps' plugin
-- https://github.com/folke/which-key.nvim
local wk = require("which-key")

local cfg = {
    window = {
        border = "single" -- none, single, double, shadow
    },
    triggers = {"<C-d>"}
}

local mappings = {
    g = {
        name = "Go",
        t = {"<Cmd>lua require('dap-go').debug_test()<CR>", "Closest test"}
    },
    p = {
        name = "Python",
        m = {
            "<Cmd>lua require('dap-python').test_method()<CR>", "Closest method"
        },
        c = {"<Cmd>lua require('dap-python').test_class()<CR>", "Closest class"},
        s = {
            "<ESC><Cmd>lua require('dap-python').debug_selection()<CR>",
            "Selection"
        }
    }
}

local opts = {prefix = "<C-d>"}

wk.register(mappings, opts)
wk.setup(cfg)
