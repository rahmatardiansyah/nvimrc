vim.lsp.config('tailwindcss', {
  cmd = { 'tailwindcss-language-server', '--stdio' },
})

vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'cssls',
  'tailwindcss',
  -- 'emmet_language_server',
  -- 'astro',
})

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- Extra

local function restart_lsp(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local clients
  if vim.lsp.get_clients then
    clients = vim.lsp.get_clients({ bufnr = bufnr })
  else
    ---@diagnostic disable-next-line: deprecated
    clients = vim.lsp.get_active_clients({ bufnr = bufnr })
  end

  for _, client in ipairs(clients) do
    vim.lsp.stop_client(client.id)
  end

  vim.defer_fn(function()
    vim.cmd('edit')
  end, 100)
end

vim.api.nvim_create_user_command('LspRestart', function()
  restart_lsp()
end, {})

local function lsp_status()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients and vim.lsp.get_clients({ bufnr = bufnr })
      or vim.lsp.get_active_clients({ bufnr = bufnr })

  if #clients == 0 then
    print('󰅚 No LSP clients attached')
    return
  end

  print('󰒋 LSP Status for buffer ' .. bufnr .. ':')
  print('─────────────────────────────────')

  for i, client in ipairs(clients) do
    print(string.format('󰌘 Client %d: %s (ID: %d)', i, client.name, client.id))
    print('  Root: ' .. (client.config.root_dir or 'N/A'))
    print('  Filetypes: ' .. table.concat(client.config.filetypes or {}, ', '))

    -- Check capabilities
    local caps = client.server_capabilities
    local features = {}
    if caps.completionProvider then
      table.insert(features, 'completion')
    end
    if caps.hoverProvider then
      table.insert(features, 'hover')
    end
    if caps.definitionProvider then
      table.insert(features, 'definition')
    end
    if caps.referencesProvider then
      table.insert(features, 'references')
    end
    if caps.renameProvider then
      table.insert(features, 'rename')
    end
    if caps.codeActionProvider then
      table.insert(features, 'code_action')
    end
    if caps.documentFormattingProvider then
      table.insert(features, 'formatting')
    end

    print('  Features: ' .. table.concat(features, ', '))
    print('')
  end
end

vim.api.nvim_create_user_command('LspStatus', lsp_status, { desc = 'Show detailed LSP status' })

local function check_lsp_capabilities()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients and vim.lsp.get_clients({ bufnr = bufnr })
      or vim.lsp.get_active_clients({ bufnr = bufnr })

  if #clients == 0 then
    print('No LSP clients attached')
    return
  end

  for _, client in ipairs(clients) do
    print('Capabilities for ' .. client.name .. ':')
    local caps = client.server_capabilities

    local capability_list = {
      { 'Completion',                caps.completionProvider },
      { 'Hover',                     caps.hoverProvider },
      { 'Signature Help',            caps.signatureHelpProvider },
      { 'Go to Definition',          caps.definitionProvider },
      { 'Go to Declaration',         caps.declarationProvider },
      { 'Go to Implementation',      caps.implementationProvider },
      { 'Go to Type Definition',     caps.typeDefinitionProvider },
      { 'Find References',           caps.referencesProvider },
      { 'Document Highlight',        caps.documentHighlightProvider },
      { 'Document Symbol',           caps.documentSymbolProvider },
      { 'Workspace Symbol',          caps.workspaceSymbolProvider },
      { 'Code Action',               caps.codeActionProvider },
      { 'Code Lens',                 caps.codeLensProvider },
      { 'Document Formatting',       caps.documentFormattingProvider },
      { 'Document Range Formatting', caps.documentRangeFormattingProvider },
      { 'Rename',                    caps.renameProvider },
      { 'Folding Range',             caps.foldingRangeProvider },
      { 'Selection Range',           caps.selectionRangeProvider },
    }

    for _, cap in ipairs(capability_list) do
      local status = cap[2] and '✓' or '✗'
      print(string.format('  %s %s', status, cap[1]))
    end
    print('')
  end
end

vim.api.nvim_create_user_command('LspCapabilities', check_lsp_capabilities, { desc = 'Show LSP capabilities' })

local function lsp_diagnostics_info()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)

  local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

  for _, diagnostic in ipairs(diagnostics) do
    local severity = vim.diagnostic.severity[diagnostic.severity]
    counts[severity] = counts[severity] + 1
  end

  print('󰒡 Diagnostics for current buffer:')
  print('  Errors: ' .. counts.ERROR)
  print('  Warnings: ' .. counts.WARN)
  print('  Info: ' .. counts.INFO)
  print('  Hints: ' .. counts.HINT)
  print('  Total: ' .. #diagnostics)
end

vim.api.nvim_create_user_command('LspDiagnostics', lsp_diagnostics_info, { desc = 'Show LSP diagnostics count' })
