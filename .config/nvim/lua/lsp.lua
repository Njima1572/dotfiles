-- {{{ Lua
vim.lsp.config("luals", {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
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
-- }}}

-- {{{ YAML
vim.lsp.config("yamlls", {
  root_markers = { '.git' },
})
-- }}}

-- {{{ TypeScript
vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {},
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = { "package.json" }
})
-- }}}

-- {{{ Python (pyright)
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
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
-- }}}

-- {{{ HTML
vim.lsp.config("html", {
  filetypes = { 'html', 'xhtml' },
  root_markers = { '.git' },
})
-- }}}

-- {{{ Go
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.mod", ".git" },
})
-- }}}

-- {{{ PHP (intelephense)
vim.lsp.config("intelephense", {
  cmd = { "intelephense", "--stdio" },
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
-- }}}

-- {{{ SQL
vim.lsp.config("sqlls", {
  cmd = { "sqls" },
  filetypes = { "sql" },
  root_markers = { ".git" },
})
-- }}}

-- {{{ Docker
-- NOTE: Commented out because it previously used lspcontainers which
-- needs a separate plugin. Uncomment and adjust if you use lspcontainers.
-- vim.lsp.config("dockerls", {
--   cmd = { "docker-langserver", "--stdio" },
--   filetypes = { "dockerfile" },
--   root_markers = { "Dockerfile", ".git" },
-- })
-- }}}

-- {{{ Terraform
vim.lsp.config("terraformls", {
  cmd = { "terraform-lsp" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform", ".git" },
})
-- }}}

-- Enable all configured servers
vim.lsp.enable({
  "luals",
  "yamlls",
  "ts_ls",
  "pyright",
  "html",
  "gopls",
  "intelephense",
  "sqlls",
  "terraformls",
})

-- LspAttach keybindings
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<Leader>h', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', "<CR>", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end
})
