vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.list = true
vim.o.listchars = 'eol:$'

vim.o.number = true

require("paq") {
  "savq/paq-nvim",

  { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd 'TSUpdate' end },

  'jdsimcoe/hyper.vim',

  'neovim/nvim-lspconfig',
  'j-hui/fidget.nvim'
}

vim.o.termguicolors = true
vim.cmd[[colorscheme hyper]]

require('plugins.lspconfig')
require('plugins.treesitter')
