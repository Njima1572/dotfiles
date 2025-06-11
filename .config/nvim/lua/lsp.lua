vim.lsp.enable({"luals", "yamlls", "dockerls"})
vim.lsp.config("luals", {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        enable = true,
        globals = { 'vim', 'describe' },
        disabled = { "lowercase-global" }
      }
    }
  }
})

vim.lsp.config("yamlls", {
  root_markers = {'.git' },
})

vim.lsp.config["dockerls"] = {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = lspcontainers.command('dockerls'),
  root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd())
}

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = {
    "package.json"
  }
})

vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  }
})
