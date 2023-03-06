require("paq") {
  "savq/paq-nvim",

  -- Syntax highlightning
  { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd 'TSUpdate' end },

  -- Colorscheme
  'jdsimcoe/hyper.vim',

  -- Lsp
  'neovim/nvim-lspconfig',

  -- Lsp UI
  'j-hui/fidget.nvim',

  -- REPL
  'hkupty/iron.nvim'
}
