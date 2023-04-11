vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.swapfile = false

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
  },
  {
    'preservim/nerdtree',
  },
  'p00f/clangd_extensions.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'sitiom/nvim-numbertoggle',
  {
    'nvim-treesitter/nvim-treesitter',
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat',
    },
  },
}, {})
require("clangd_extensions").setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files()
end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep()
end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers()
end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', function()
  builtin.help_tags()
end, { noremap = true, silent = true })

require('leap').add_default_mappings()