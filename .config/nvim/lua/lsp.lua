-- LSP Configuration
local M = {}

-- Enable LSP servers
vim.lsp.enable({
  "lua_ls",
  "yamlls", 
  "dockerls",
  "ts_ls",
  "pyright",
  "html",
  "gopls",
  "intelephense",
  "sqlls"
})

-- Lua Language Server
vim.lsp.config("lua_ls", {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        enable = true,
        globals = { 'vim', 'describe' },
        disabled = { "lowercase-global" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    }
  }
})

-- YAML Language Server
vim.lsp.config("yamlls", {
  root_markers = { '.git' },
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
      }
    }
  }
})

-- Docker Language Server
vim.lsp.config("dockerls", {
  root_markers = { 'Dockerfile', '.git' },
})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
  filetypes = {
    "javascript",
    "javascriptreact", 
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})

-- Python
vim.lsp.config("pyright", {
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic"
      }
    }
  }
})

-- HTML
vim.lsp.config("html", {
  filetypes = { 'html', 'xhtml' },
  root_markers = { '.git' },
})

-- Go
vim.lsp.config("gopls", {
  root_markers = { "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- PHP (Intelephense)
vim.lsp.config("intelephense", {
  filetypes = { "php" },
  root_markers = { "composer.json", ".git" },
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          "./vendor/**",
        }
      },
      files = {
        maxSize = 10000000,
      }
    }
  }
})

-- SQL
vim.lsp.config("sqlls", {
  root_markers = { ".git" },
  on_attach = function(client, _)
    -- Disable formatting since we use conform.nvim
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- LSP Keymaps and Autocommands
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    
    -- Navigation
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    
    -- Actions
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    
    -- Diagnostics
    vim.keymap.set('n', '<leader>h', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    
    -- Format (handled by conform.nvim, but keeping LSP fallback)
    vim.keymap.set('n', '<CR>', function()
      require('conform').format({ bufnr = ev.buf, lsp_fallback = true })
    end, opts)
  end
})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- Diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return M