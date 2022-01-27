local wk = require("which-key")

local mappings = {
    ["<leader>"] = {
        name = "Action",
        r = {"<Cmd>lua require('dap').repl.toggle()<CR>", "Toggle Repl"},
        b = {"<Cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Break Point"},
        c = {"<Cmd>:lua require('dap').continue()<CR>", "Continue"},
        s = {"<Cmd>lua require('dap').step_over()<CR>", "Step Over"},
        i = {"<Cmd>lua require('dap').step_into()<CR>", "Step Into"},
        o = {"<Cmd>lua require('dap').step_out()<CR>", "Step Out"},
    },
    g = {
        name = "Go",
        t = {"<Cmd>lua require('dap-go').debug_test()<CR>", "Closest Test"}
    },
    p = {
        name = "Python",
        m = {
            "<Cmd>lua require('dap-python').test_method()<CR>", "Closest Method"
        },
        c = {"<Cmd>lua require('dap-python').test_class()<CR>", "Closest Class"},
        s = {
            "<ESC><Cmd>lua require('dap-python').debug_selection()<CR>",
            "Selection"
        }
    }
}

local opts = {prefix = "<C-d>"}

wk.register(mappings, opts)
