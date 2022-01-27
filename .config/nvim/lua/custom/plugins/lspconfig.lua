local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    local servers = {"clangd", "gopls", "pyright", "rust_analyzer", "sumneko_lua"}

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = attach,
            capabilities = capabilities,
            flags = {debounce_text_changes = 150}
        }
    end
end

return M
