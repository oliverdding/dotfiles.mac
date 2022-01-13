-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- PLUGINS
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    -- faster filetype
    use {"nathom/filetype.nvim"}

    -- smooth scroll
    use {
        "karb94/neoscroll.nvim",
        opt = true,
        config = function() require("neoscroll").setup() end,

        -- lazy loading
        setup = function()
            require("core.utils").packer_lazy_load "neoscroll.nvim"
        end
    }
end)

-- SETTINGS
-- load filetype.nvim instead of filetype.vim
vim.g.did_load_filetypes = 1
