lua << EOF
require'lspconfig'.sumneko_lua.setup{
  cmd = require'lspcontainers'.command('sumneko_lua')
}
-- {{{ Python
require'lspconfig'.pylsp.setup{ 
  cmd = require'lspcontainers'.command('pylsp')
}
require'lspconfig'.pyright.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('pyright'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
-- }}}
-- {{{ Rust
require'lspconfig'.rust_analyzer.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('rust_analyzer'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
-- }}}
-- {{{ Ruby
require'lspconfig'.solargraph.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('solargraph'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
-- }}}
-- {{{ TS / Vue
require'lspconfig'.tsserver.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('tsserver'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}

require'lspconfig'.vuels.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('vuels'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
-- }}}
-- {{{ Yaml
require'lspconfig'.yamlls.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('yamlls'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
--  }}}
-- {{{ HTML
require'lspconfig'.html.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('html'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
--  }}}
-- {{{ Docker
require'lspconfig'.dockerls.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('dockerls'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
--  }}}
-- {{{ Bash
require'lspconfig'.bashls.setup{
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('bashls'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
}
--  }}}
EOF
