function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)

  local diagnostic_tbl = {}

  for i, diagnostic in ipairs(line_diagnostics) do
    local highlight = "None"
    local diagnostic_message = ""

    if diagnostic.severity == vim.diagnostic.severity.ERROR then
      diagnostic_message = string.format("  %s", diagnostic.message or "")
      highlight = "ErrorMsg"
    end

    if diagnostic.severity == vim.diagnostic.severity.WARN then
      diagnostic_message = string.format("  %s", diagnostic.message or "")
      highlight = "WarningMsg"
    end

    if diagnostic.severity == vim.diagnostic.severity.HINT then
      diagnostic_message = string.format(" %s", diagnostic.message or "")
      highlight = "Statement"
    end

    if diagnostic.severity == vim.diagnostic.severity.INFO then
      diagnostic_message = string.format("  %s", diagnostic.message or "")
      highlight = "None"
    end
    
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end

    if diagnostic_message ~= "" then
      table.insert(diagnostic_tbl, {diagnostic_message, highlight})
    end

    -- only output single error per line to disable "Press ENTER to continue"
    -- TODO fix this to show multiple errors
    break
  end

  vim.api.nvim_echo(diagnostic_tbl, false, {})
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

