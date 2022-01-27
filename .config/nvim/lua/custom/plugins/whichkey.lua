-- https://github.com/folke/which-key.nvim
local wk = require("which-key")

local cfg = {
    window = {
        border = "single" -- none, single, double, shadow
    },
    triggers = {
        "<C-d>", -- dap
    }
}

wk.setup(cfg)
