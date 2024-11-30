local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = { "clangd", "--compile-commands-dir=build"}
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.volar.setup({
  on_attach = on_attach, -- Reuse your existing on_attach function
  capabilities = capabilities, -- Reuse your existing capabilities
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }, -- Files Volar should handle
  init_options = {
    typescript = {
      tsdk = '/path/to/node_modules/typescript/lib', -- Optional: Point to a specific TypeScript version
    },
    languageFeatures = {
      implementation = true, -- Enable go-to-implementation
      references = true, -- Enable find-references
      definition = true, -- Enable go-to-definition
      typeDefinition = true, -- Enable go-to-type-definition
      callHierarchy = true, -- Enable call hierarchy
      hover = true, -- Enable hover information
      rename = true, -- Enable renaming
      renameFileRefactoring = true, -- Enable file renaming refactoring
      completion = {
        defaultTagNameCase = "both",
        defaultAttrNameCase = "kebabCase",
      },
    },
  },
})

lspconfig.glsl_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
