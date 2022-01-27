local map = require("core.utils").map

-- dap
map("n", "<Leader>dr", "<Cmd>lua require('dap').repl.toggle()<CR>")
map("n", "<Leader>db", "<Cmd>lua require('dap').toggle_breakpoint()<CR>")

map("n", "<C-S-c>", "<Cmd>:lua require('dap').continue()<CR>")
map("n", "<C-S-s>", "<Cmd>lua require('dap').step_over()<CR>")
map("n", "<C-S-i>", "<Cmd>lua require('dap').step_into()<CR>")
map("n", "<C-S-o>", "<Cmd>lua require('dap').step_out()<CR>")
