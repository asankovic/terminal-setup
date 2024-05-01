return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "lua_ls",
        "bashls",
        "dockerls",
        "eslint",
        "jsonls",
        -- "jqls",
        "lemminx",
        "yamlls",
        "sqlls",
        -- "graphql",
        -- "pyright",
        -- "gradle_ls
        -- "groovyls",
        -- "terraformls",
        -- "ansiblels",
      },
    })
  end,
}
