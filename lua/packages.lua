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
    'neoclide/coc.nvim',
    branch = 'release',
  },
  'projekt0n/circles.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  {
   'autozimu/LanguageClient-neovim',
   build = {
    'powershell -executionpolicy bypass -File install.ps1'
   },
  },
  'lambdalisue/nerdfont.vim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'karb94/neoscroll.nvim',
  'voldikss/vim-floaterm',
  'preservim/nerdtree',
  'p00f/clangd_extensions.nvim',
  'neovim/nvim-lspconfig',
  'L3MON4D3/LuaSnip',
  'hrsh7th/nvim-cmp',
  'sitiom/nvim-numbertoggle',
  'nvim-treesitter/nvim-treesitter',  
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

local circles = require('circles')
circles.setup()

require("nvim-tree").setup({
    renderer = {
        icons = {
            glyphs = circles.get_nvimtree_glyphs(),
        },
    },
})
require("nvim-web-devicons").setup()
require("nvim-web-devicons").get_icons()
