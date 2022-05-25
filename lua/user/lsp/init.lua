local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require "user.lsp.lsp-utils"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.lsp_signature"
require "user.lsp.diagnostic"
require "user.lsp.formatting"
require "code_action_menu"

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
