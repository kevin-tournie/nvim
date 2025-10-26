return {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup({
            ensure_installed = { "lua-language-server", "bash-language-server", "typescript-language-server", "vue-language-server", "jdtls" }
        })
    end
}
