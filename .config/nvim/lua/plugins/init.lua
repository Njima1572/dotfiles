return {
  { 'nvim-lua/plenary.nvim' }, -- neovim-lua library some projects depend on this
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'shaunsingh/moonlight.nvim' }, -- Moonlight theme
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'moonlight',
      },
      sections = {
        lualine_c = { { 'filename', path = 1, } }
      }
    }
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      { "nvim-tree/nvim-web-devicons" }
    },
    opts = {},
  },
  {
    'smoka7/hop.nvim',
    config = function()
      local hop = require('hop')
      hop.setup()
      vim.keymap.set("n", ",w", "<cmd>HopWord<cr>")
      vim.keymap.set("n", ",l", "<cmd>HopLine<cr>")
      vim.keymap.set("n", ",p", "<cmd>HopPattern<cr>")
      vim.keymap.set("n", ",a", "<cmd>HopAnywhere<cr>")
    end
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
  },

  { 'cohama/lexima.vim' },

  {
    "nvim-telescope/telescope.nvim",
    config = require 'plugins/configs/telescope',
  },
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup({})
      vim.keymap.set("n", 'gp', "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { noremap = true })
    end
  },
  --- Color
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "VeryLazy" },
    build = ':TSUpdate',
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treeitter** module to be loaded in time.
      -- Luckily, the only thins that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      ensure_installed = { "vim", "c", "c_sharp", "dockerfile", "lua", "javascript", "typescript", "gitcommit" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      --- if type(opts.ensure_installed) == "table" then
      ---   ---@type table<string, boolean>
      ---   local added = {}
      ---   opts.ensure_installed = vim.tbl_filter(function(lang)
      ---     if added[lang] then
      ---       return false
      ---     end
      ---     added[lang] = true
      ---     return true
      ---   end, opts.ensure_installed)
      --- end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    'petertriho/nvim-scrollbar',
    dependencies = {
      { 'shaunsingh/moonlight.nvim' }, -- Moonlight theme
    },
    config = function()
      local colors = require('moonlight');
      require 'scrollbar'.setup({
        handle = {
          color = colors.bg_highlight,
        },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        }
      })
    end
  },
  { 'nvim-lualine/lualine.nvim' },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    keys = {
      { "<leader>b", "<cmd>Neotree buffers float<cr>",        mode = "n" },
      { "<leader>o", "<cmd>LspNeoTree<cr>",                   mode = "n" },
      { "<leader>O", "<cmd>Neotree toggle float dir=%:h<cr>", mode = "n" },
    },
    config = function()
      function GetLspRootDir()
        local clients = vim.lsp.buf_get_clients()
        for _, client in pairs(clients) do
          return client.config.root_dir
        end
        return nil
      end

      local find_buffer_by_type = function(type)
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local ft = vim.api.nvim_buf_get_option(buf, "filetype")
          if ft == type then return buf end
        end
        return -1
      end

      vim.api.nvim_create_user_command('LspNeoTree', function()
        local root_dir = GetLspRootDir()
        local neotree_command = require('neo-tree.command')
        if find_buffer_by_type "neo-tree" > 0 then
          neotree_command.execute { action = "close" }
        else
          if root_dir then
            neotree_command.execute({ action = "focus", dir = root_dir, position = "float" })
          else
            neotree_command.execute({ action = "focus", dir = vim.fn.getcwd(), position = "float" })
          end
        end
      end, {})

      -- vim.keymap.set("n", "<leader>o", "<cmd>LspNeoTree<cr>")


      require('neo-tree').setup(
        {
          enable_diagnostics = true,
          filesystem = {
            hijack_netrw_behavior = "open_default",
            filtered_items = {
              visible = true
            },
            window = {
              mappings = {
                ["o"] = "open",
                ["e"] = "move_cursor_up",
                ["n"] = "move_cursor_down",
                ["h"] = "navigate_up"
              }
            },
          },
          buffers = {
            window = {
              mappings = {
                ["o"] = "open",
                ["e"] = "move_cursor_up",
                ["n"] = "move_cursor_down",
              }
            },
          }
        }
      )
    end
  },
  {
    'Shatur/neovim-session-manager',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),               -- The directory where the session files will be saved.
        path_replacer = '__',                                                      -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++',                                                     -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true,                                              -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true,                                         -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_filetypes = {                                              -- All buffers of these file types will be closed before the session is saved.
          'gitcommit',
        },
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80,             -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      })
    end

  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<leader>tt]],
        insert_mappings = false
      })
    end
  },

  --- Lsps
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'lspcontainers/lspcontainers.nvim' },
      { 'Hoffs/omnisharp-extended-lsp.nvim' },
    },

    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local pid = vim.fn.getpid()
      local lspconfig = require('lspconfig')
      local lspcontainers = require('lspcontainers')
      -- vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.diagnostic.open_float()<CR>',
      --   { noremap = true, silent = true })
      -- {{{ Yaml
      lspconfig.yamlls.setup {
        before_init = function(params)
          params.processId = vim.NIL
        end,
        cmd = lspcontainers.command('yamlls'),
        root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd())
      }
      --  }}}
      -- {{{ Lua
      lspconfig.lua_ls.setup {
        before_init = function(params)
          params.processId = vim.NIL
        end,
        cmd = lspcontainers.command('lua_ls'),
        settings = {
          Lua = {
            diagnostics = {
              enable = true,
              globals = { 'vim', 'describe' },
              disabled = { "lowercase-global" }
            }
          }
        },
        root_dir = function(fname)
          -- print(fname)
          local resolved_dir = lspconfig.util.root_pattern('.git')(fname) or
              lspconfig.util.root_pattern(".luacheckrc")(fname) or
              lspconfig.util.path.dirname(fname)
          print("Resolved LSP root_dir: " .. resolved_dir) -- Debug print
          return resolved_dir
          -- return require 'lspconfig'.util.root_pattern('.git', vim.fn.getcwd())()
          --        or require 'lspconfig'.util.root_pattern(".luacheckrc", vim.fn.getcwd())()
          --        -- or require 'lspconfig'.util.path.dirname(fname)
        end
      }
      --  }}}
      -- {{{ Docker
      lspconfig.dockerls.setup {
        before_init = function(params)
          params.processId = vim.NIL
        end,
        cmd = lspcontainers.command('dockerls'),
        root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd())
      }
      --  }}}
      -- {{{ TS
      lspconfig.tsserver.setup {
        before_init = function(params)
          params.processId = vim.NIL
        end,
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = lspconfig.util.root_pattern("package.json", vim.fn.getcwd()),
        capabilities = capabilities
      }
      -- }}}
      -- {{{ Python
      lspconfig.pyright.setup {
        before_init = function(params)
          params.processId = vim.NIL
        end,
        cmd = lspcontainers.command('pyright'),
        root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
        capabilities = capabilities
      }
      -- }}}
      -- {{{ Csharp

      local omnisharp_bin = "/home/kn/.local/omnisharp/run"
      lspconfig.omnisharp.setup {
        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        handlers = {
          ["textDocument/definition"] = require('omnisharp_extended').handler,
        },
        before_init = function(params)
          params.processId = vim.NIL
        end,
        enable_roslyn_analysers = true,
        enable_import_completion = true,
        organize_imports_on_format = true,
        filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props' },
        root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", vim.fn.getcwd()),
        capabilities = capabilities
      }
      -- }}}
      -- {{{ HTML
      lspconfig.html.setup {
        filetypes = { 'html', 'xhtml' },
        before_init = function(params)
          params.processId = vim.NIL
        end,
        cmd = lspcontainers.command('html'),
        root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
      }
      -- }}}

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          -- vim.keymap.set('n', 'gh', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<Leader>h', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', "<CR>", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end
      })
    end
  },
  { 'folke/lsp-colors.nvim' },

  --- Git
  -- {'airblade/vim-gitgutter'}
  -- {'tpope/vim-fugitive'}
  -- {'wting/gitsessions.vim'}
  {
    'NeogitOrg/neogit',
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    config = function()
      local neogit = require('neogit')
      neogit.setup({
        vim.keymap.set("n", '<leader>ng', "<cmd>Neogit<CR>")
      })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      numhl = true,
      linehl = false,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end

    }
  },

  --- Web development
  { 'alvan/vim-closetag' },
  { 'norcalli/nvim-colorizer.lua' },

  -- Javascript
  {
    'mxw/vim-jsx',
    event = "BufEnter",
    ft = { "javascript", "typescript" },
  },
  {
    'pangloss/vim-javascript',
    event = "BufEnter",
    ft = { "javascript", "typescript" },
  },

  --- Completion
  -- ~/.config/nvim/cmp.lua for config
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-cmdline' },
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,

  },
  { 'hrsh7th/vim-vsnip' },
  {
    'rinx/cmp-skkeleton',
    after = { 'nvim-cmp', 'skkeleton' },
    config = function()
      require 'cmp'.setup {
        sources = {
          { name = 'skkeleton' }
        },
        view = {
          -- entries = 'native'
        }
      }
    end
  },
  {
    'vim-skk/skkeleton',
    -- event = "InsertEnter",
    dependencies = {
      { 'vim-denops/denops.vim' }
    },
    config = function()
      vim.keymap.set("i", "<C-l>", "<Plug>(skkeleton-toggle)", { noremap = true, silent = true })
      vim.fn["skkeleton#config"]({
        globalJisyo = "/usr/share/skk/SKK-JISYO.L"
      })
    end
  },
  {
    'github/copilot.vim'
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
}
