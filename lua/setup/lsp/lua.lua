return {
  setup = function(lspconfig, capabilities, on_attach)
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
            disable = { 'inject-field' },
          },
          workspace = {
            -- stop the annoying message from luassert
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
          hint = {
            enable = true,
            setType = false,
            paramType = true,
            paramName = "Disable",
            semicolon = "Disable",
            arrayIndex = "Disable",
          },
          doc = {
            privateName = { "^_" },
          },
          completion = {
            callSnippet = "Replace",
          },
          codeLens = {
            enable = true,
          },
        },
      },
    })
  end,
}
