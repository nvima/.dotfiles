local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require 'lspconfig'.volar.setup {
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
}
require 'lspconfig'.tailwindcss.setup {}
require 'lspconfig'.cssls.setup {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetype = { "css", "scss", "less", "vue"},
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
}
