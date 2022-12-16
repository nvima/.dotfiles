local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require 'lspconfig'.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  init_options = {
    typescript = {
      serverPath = '/home/jens/.npm-global/lib/node_modules/typescript/lib/tsserverlibrary.js'
      -- Alternative location if installed as root:
      -- serverPath = '/usr/local/lib/node_modules/typescript/lib/tsserverlibrary.js'
    }
  },
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
  filetype = { "css", "scss", "less", "vue" },
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
}
