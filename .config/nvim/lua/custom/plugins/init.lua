local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    -- ui
    use {"nathom/filetype.nvim"}

    use {
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    }

end)
