local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
     if client.name == 'omnisharp' then
        local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        for i, v in ipairs(tokenModifiers) do
            tokenModifiers[i] = v:gsub(' ', '_')
        end
        local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        for i, v in ipairs(tokenTypes) do
        tokenTypes[i] = v:gsub(' ', '_')
        end
    end
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
})
lsp.setup()
