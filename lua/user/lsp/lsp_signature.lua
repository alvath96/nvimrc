local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

local cfg = {
  hint_prefix = " ",
}
lsp_signature.setup(cfg)
