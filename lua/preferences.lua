-----------------
-- Normal mode --
-----------------
-- Nvim tree
vim.keymap.set('n', '<A-l>', ':NvimTreeToggle<CR>', opts)

-- copilot
vim.keymap.set('n', '<A-c>', ':CopilotChat<CR>', opts)

-- neogit
vim.keymap.set('n', '<A-g>', ':Neogit <CR>', opts)

-- telescope
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fp', ':Telescope projects<CR>')

-- terminal
vim.keymap.set('n', '<A-t>', ':vsp term://fish<CR>')
vim.keymap.set('n', '<C-z>', ':split term://fish<CR>')

-- error
vim.keymap.set('n', '<A-e>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- expand error information 

-------------------
-- Terminal mode --
-------------------
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', opts)

-----------------
-- Visual mode --
-- --------------
vim.keymap.set('v', '<A-c>', ':CopilotChat<CR>', opts)

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
