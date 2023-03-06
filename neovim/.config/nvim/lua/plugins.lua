require("paq") {
  "savq/paq-nvim",

  -- Syntax highlightning
  --
  { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd 'TSUpdate' end },

  -- UI
  --
  'nvim-tree/nvim-web-devicons',

  -- Colorscheme
  --
  'jdsimcoe/hyper.vim',

  -- Lsp
  --
  'neovim/nvim-lspconfig',
  'ray-x/lsp_signature.nvim',

  -- Lsp UI
  --
  'j-hui/fidget.nvim',
  'onsails/lspkind.nvim',
  'kosayoda/nvim-lightbulb',
  'glepnir/lspsaga.nvim',

  -- REPL
  --
  'hkupty/iron.nvim',
  
  -- Misc
  --
  'antoinemadec/FixCursorHold.nvim' -- Required by nvim-lightbulb

}
