local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    -- lspservers with default config

    local servers = {
        "rust_analyzer", -- rust
        "gopls", -- go
        "sumneko_lua" -- lua
    }

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = attach,
            capabilities = capabilities,
            flags = {debounce_text_changes = 150}
        }
    end

    -- c

    lspconfig.clangd.setup {
        on_attach = attach,
        capabilities = capabilities,
        cmd = {"clangd-mp-12"}
    }
end

return M
