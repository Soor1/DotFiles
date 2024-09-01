-- Set Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Tab Settings
vim.opt.expandtab = true -- tab makes spaces instead of tabs
vim.opt.softtabstop = 4 -- 4 spaces inserted instead of tab
vim.opt.shiftwidth = 4 -- indenting is 4 spaces

-- Set Line Number
vim.opt.number = true
vim.opt.relativenumber = true

-- Make nvim copy the same as OS copy
vim.opt.clipboard = 'unnamedplus'

-- Setting Delete Keymaps
vim.api.nvim_set_keymap('n', 'dfw', 'ggdG', { noremap = true, silent = true }) -- Delete Whole File 
vim.api.nvim_set_keymap('n', 'dw', 'daw', { noremap = true, silent = true }) -- Delete Word No Matter Cursor Pos

-- Setting Copy Key
vim.api.nvim_set_keymap('n', 'cc', 'yy', { noremap = true, silent = true }) -- Copy Line
vim.api.nvim_set_keymap('n', 'cap', 'yap', { noremap = true, silent = true }) -- Copy Around Paragraph
vim.api.nvim_set_keymap('n', 'cwf', 'ggVGy', { noremap = true, silent = true }) -- Copy Whole File

-- Setting Leader Keybinds
vim.keymap.set('n', '<leader>sf', ':Ex<Cr>', { desc = 'Open File Explorer' })

-- Yank Around Paragraph Highlight Function
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Install The Lazy Package Manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set Theme
require('lazy').setup({
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}, {'morhetz/gruvbox'}, 

})
vim.cmd('colorscheme gruvbox')

-- Tree sitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true, 
        disable = {},
    },
}

