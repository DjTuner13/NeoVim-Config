return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        -- Set up null-ls
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                --null_ls.builtins.formatting.standardts,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.uncrustify,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.cppcheck,
                --null_ls.builtins.diagnostics.eslint_d,
                --null_ls.builtins.diagnostics.cpplint,
            },
            -- Enable auto-format on save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })

        -- Manual format mapping
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

