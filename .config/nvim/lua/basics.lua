local set = vim.opt

set.number = true
set.hidden = true

set.exrc         = true
set.backup       = false
set.title        = true
set.autoindent   = true
set.smartindent  = true
set.cursorline   = true
set.cursorcolumn = true
set.showcmd      = true
set.virtualedit  = 'onemore'
set.hlsearch     = true
set.wrapscan     = true
set.incsearch    = true
set.errorbells   = false
set.swapfile     = false
set.scrolloff    = 40
set.mouse        = ''

set.undofile = true
set.undodir = os.getenv('HOME') .. '/.vim/undo'

set.foldmethod = 'marker'

----- Tab stuff
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.listchars = { tab = '--' }

vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.opt_local.autoindent = true
    end,
})

vim.diagnostic.config({
    virtual_text = true, -- エラーをコード横に表示
    signs = true,        -- 行番号の横に表示
    underline = true,    -- 下線でエラー箇所を表示
    update_in_insert = false, -- インサートモード中は更新しない
    severity_sort = true, -- エラーの重要度で並び替え
})


vim.cmd 'hi CursorLine ctermbg=242 guibg=#414863'
