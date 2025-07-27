-----------------
-- Normal mode --
-----------------
-- Windows navigation
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

-- Nvim tree
vim.keymap.set('n', '<Leader>ls', ':NvimTreeToggle<CR>', opts)

-- copilot
vim.keymap.set('n', '<Leader>co', ':CopilotChat<CR>', opts)

-- neogit
vim.keymap.set('n', '<Leader>gi', ':Neogit <CR>', opts)

-- telescope
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fp', ':Telescope project<CR>')
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>fs', ':Telescope lsp_document_symbols<CR>')
vim.keymap.set("n", "<Leader>fb", ':Telescope file_browser<CR>')
vim.keymap.set('n', '<Leader>se', ':Telescope current_buffer_fuzzy_find<CR>')

-- terminal
vim.keymap.set('n', '<Leader>tv', ':vsp term://fish<CR>')
vim.keymap.set('n', '<Leader>ts', ':split term://fish<CR>')

-- diagnostic
vim.keymap.set('n', '<Leader>sd', '<cmd>lua vim.diagnostic.open_float()<CR>',
               opts) -- expand error information

-- formatter
vim.keymap.set('n', '<Leader>fm', ':Format<CR>')
vim.keymap.set('n', '<Leader>fw', ':FormatWrite<CR>')

-- dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b',
               function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function()
    require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>da',
               function() require('dapui').toggle() end)

-- rename
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)

-------------------
-- Terminal mode --
-------------------
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', opts)

-----------------
-- Visual mode --
-- --------------
vim.keymap.set('v', '<Leader>co', ':CopilotChat<CR>', opts)

---------
-- set --
-- ------
vim.opt.number = true
vim.opt.listchars = "tab:┊ ,space:·"
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.splitright = true
vim.opt.expandtab = true

----------------------
-- copilot settings --
-- -------------------
vim.g.copilot_enabled = false
