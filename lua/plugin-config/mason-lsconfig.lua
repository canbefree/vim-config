require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "tsserver" },
}

require'lspconfig'.tsserver.setup{
}
