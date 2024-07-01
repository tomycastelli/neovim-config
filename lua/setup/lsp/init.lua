local M = {}

M.on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end

  require('setup.autocommand').lsp_autocmds(client, bufnr)
  -- check if this is applicable (for rust for example it is not)
  -- https://github.com/L3MON4D3/LuaSnip/wiki/Misc#improve-language-server-snippets
end
M.capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- workaround until neovim supports multiple client encodings
  capabilities = vim.tbl_deep_extend('force', capabilities, {
    offsetEncoding = { 'utf-16' },
    general = {
      positionEncodings = { 'utf-16' },
    },
  })
  return capabilities
end

M.config_defaults = function()
  local lspconfig = require('lspconfig')
  -- python
  lspconfig.pyright.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities(),
  })
  -- json
  lspconfig.jsonls.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities(),
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
        end,
      },
    },
    settings = {
      json = {
        schemas = require('schemastore').json.schemas({
          extra = {
            {
              description = 'Monkeys Schema',
              fileMatch = { 'monkeys/config.json', 'monkeys/example.json' },
              name = 'Infinite Monkeys',
              url = 'file://' .. vim.fn.getcwd() .. '/monkeys/schema.json',
            },
          },
        }),
        validate = { enable = true },
      },
    },
  })
  -- docker
  lspconfig.dockerls.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities(),
  })

  -- tailwind
  lspconfig.tailwindcss.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities(),
  })
end
M.setup = function()
  local lspconfig = require('lspconfig')
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'jdtls' },
    automatic_installation = true,
  })
  require('mason-tool-installer').setup({
    ensure_installed = {
      'markdownlint',
      'shfmt',
      'stylua',
      'selene',
      'pylint',
      'tailwincss',
      'write-good',
    },
  })
  -- general LSP config
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
    virtual_text = false,
    signs = true,
  })

  -- show icons in the sidebar
  local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
  vim.fn.sign_define(
    'LightBulbSign',
    { text = '💡', texthl = 'LspDiagnosticsDefaultInformation', numhl = 'LspDiagnosticsDefaultInformation' }
  )

  vim.diagnostic.config({
    severity_sort = true,
  })
  return lspconfig
end
return M
