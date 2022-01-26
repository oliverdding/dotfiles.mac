local map = require("core.utils").map

map("n", "<C-s>", ":w<CR>")
map("n", "<C-q>", ":q<CR>")

map("n", "<leader>cc", ":Telescope <CR>")
