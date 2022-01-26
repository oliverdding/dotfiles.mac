local M = {}

M.options = {tabstop = 4, shiftwidth = 4}

M.ui = {italic_comments = true, theme = "gruvbox", transparency = false}

M.plugins = {
    status = {colorizer = true},
    options = {
        statusline = {
            style = "arrow" -- default, round , slant , block , arrow
        }
    },
    default_plugin_config_replace = {
        nvim_treesitter = {
            ensure_installed = {
                "bash", "c", "cmake", "cpp", "dockerfile", "go", "java",
                "json5", "latex", "llvm", "lua", "make", "python", "regex",
                "rust", "scala", "toml", "yaml"
            }
        },
        nvim_tree = {
            view = {side = 'right', auto_resize = true},
            trash = {cmd = "rmtrash", require_confirm = true}
        }
    }
}

return M
