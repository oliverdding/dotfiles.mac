local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    -- ui
    use {"nathom/filetype.nvim"}

    use {
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    }

    -- dap
    use {
        "folke/which-key.nvim",
        config = function() require "custom.plugins.whichkey" end
    }

    use {
        "mfussenegger/nvim-dap",
        after = "nvim-lspconfig",
        config = function() require "custom.plugins.dap" end
    }

    use {
        "theHamsta/nvim-dap-virtual-text",
        after = {"nvim-dap", "nvim-treesitter"},
        config = function()
            require("nvim-dap-virtual-text").setup {commented = true}
        end
    }

    use {
        "leoluz/nvim-dap-go",
        opt = true,
        after = "nvim-dap",
        config = function() require("dap-go").setup() end
    }

    use {
        "mfussenegger/nvim-dap-python",
        opt = true,
        after = "nvim-dap",
        config = function() require("dap-python").setup("python") end
    }
end)
