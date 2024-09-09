-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-Left>', '<C-w>h', opts)
vim.keymap.set('n', '<C-Down>', '<C-w>j', opts)
vim.keymap.set('n', '<C-Up>', '<C-w>k', opts)
vim.keymap.set('n', '<C-Right>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-S-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-S-Right>', ':vertical resize +2<CR>', opts)

-- Nvim tree
vim.keymap.set('n', '<A-t>', ':NvimTreeToggle<CR>', opts)

-- copilot
vim.keymap.set('n', '<A-c>', ':Copilot panel<CR>', opts)

-- neogit
vim.keymap.set('n', '<A-g>', ':Neogit <CR>', opts)

-- telescope
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fp', ':Telescope projects<CR>')

-- terminal
vim.keymap.set('n', '<A-z>', ':vsp term://zsh<CR>')
vim.keymap.set('n', '<C-z>', ':split term://zsh<CR>')

-------------------
-- Terminal mode --
-------------------
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', opts)

---------
-- set --
-- ------
vim.opt.number = true
vim.opt.listchars = "tab:┊ ,space:·"
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

--------------------------------
-- disable copilot by default --
-- -----------------------------
vim.g.copilot_enabled = false
