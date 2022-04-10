function OrganizeImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit)
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end


function Format()
  vim.api.nvim_command("lua vim.lsp.buf.formatting_sync()")
  vim.api.nvim_command('lua OrganizeImports()') 
end

-- auto format on save
-- TODO use pure lua
vim.cmd [[
  augroup format
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua Format()
  augroup end
]]
