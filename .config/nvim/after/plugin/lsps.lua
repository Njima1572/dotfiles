-- {{{ Lua
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
-- }}}
-- {{{ Python
require 'lspconfig'.pylsp.setup {
  cmd = require 'lspcontainers'.command('pylsp'),
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 200,
        },
        flake8 = {
          maxLineLength = 200,
        }
      }
    }
  }
}
-- require'lspconfig'.pyright.setup{
--   before_init = function(params)
--     params.processId = vim.NIL
--   end,
--   cmd = require'lspcontainers'.command('pyright'),
--   root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
-- }
-- }}}
-- {{{ Rust
require 'lspconfig'.rust_analyzer.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = require 'lspcontainers'.command('rust_analyzer', { root_dir = new_root_dir, network = "bridge" })
  end,
  cmd = require 'lspcontainers'.command('rust_analyzer', {
    network = "bridge",
  }),
  root_dir = require 'lspconfig'.util.root_pattern("Cargo.toml")
}
-- }}}
-- {{{ Ruby
require 'lspconfig'.solargraph.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require 'lspcontainers'.command('solargraph'),
  root_dir = require 'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
-- }}}
-- {{{ TS / Vue
require 'lspconfig'.tsserver.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = require 'lspcontainers'.command('tsserver', { root_dir = new_root_dir })
  end,
  cmd = require 'lspcontainers'.command('tsserver'),
  root_dir = require 'lspconfig'.util.root_pattern("package.json")
}

require 'lspconfig'.vuels.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = require 'lspcontainers'.command('vuels', { root_dir = new_root_dir })
  end,
  cmd = require 'lspcontainers'.command('vuels'),
  root_dir = require 'lspconfig'.util.root_pattern("package.json")
}
-- }}}
-- {{{ Yaml
require 'lspconfig'.yamlls.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require 'lspcontainers'.command('yamlls'),
  root_dir = require 'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
--  }}}
-- {{{ HTML
require 'lspconfig'.html.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require 'lspcontainers'.command('html'),
  root_dir = require 'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
--  }}}
-- {{{ Docker
require 'lspconfig'.dockerls.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require 'lspcontainers'.command('dockerls'),
  root_dir = require 'lspconfig'.util.root_pattern(".git", vim.fn.getcwd()),
  settings = {
    vim = {
      lsp = {
        buf = {
          format = {
            async = true
          }
        }
      }
    }
  }
}
--  }}}
-- {{{ Bash
require 'lspconfig'.bashls.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require 'lspcontainers'.command('bashls'),
  root_dir = require 'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
--  }}}
-- {{{ Dart/Flutter
--  Could not use docker for this
-- It seems like dart/flutter compiler has the analyzer within it, no extra tool needs to be installed,
-- It also checks for the directory of where pubspec.yaml exists and checks for installed packages
-- Needs to use some mounting for lsp and that feels kinda weird to do with lsp server with docker

-- There are two options to use
-- require'lspconfig'.dartls.setup{}
require("flutter-tools").setup {}
--  }}}
-- {{{ Go
-- require 'lspconfig'.gopls.setup {
--   before_init = function(params)
--     params.processId = vim.NIL
--   end,
--   cmd = require 'lspcontainers'.command('gopls'),
--   root_dir = require 'lspconfig'.util.root_pattern("go.mod", vim.fn.getcwd())
-- }
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
lspconfig.gopls.setup {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
--  }}}
