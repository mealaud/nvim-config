return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("null-ls").setup({
            sources = {
                require("null-ls").builtins.formatting.latexindent.with({
                    extra_args = {
                        "-y",
                        "noAdditionalIndent:document:0;problem:0,defaultIndent:'  ',verbatimEnvironments:cpp:1;python:1",
                    },
                }),
                require("null-ls").builtins.formatting.prettierd, -- TODO: Waiting for prettierd to be packaged by Nix
                require("null-ls").builtins.formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces" },
                }),
                require("null-ls").builtins.diagnostics.selene,
            },
        })
    end,
}
