local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.lsp_signature"
require "user.lsp.diagnostic"
require "user.lsp.formatting"
require "code_action_menu"
require 'nice-reference'.setup({
    anchor = "NW", -- Popup position anchor
    relative = "cursor", -- Popup relative position
    row = 1, -- Popup x position
    col = 0, -- Popup y position
    border = "rounded", -- Popup borderstyle
    winblend = 0, -- Popup transaparency 0-100, where 100 is transparent
    max_width = 120, -- Max width of the popup
    max_height = 10, -- Max height of the popup
    auto_choose = false, -- Go to reference if there is only one
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
