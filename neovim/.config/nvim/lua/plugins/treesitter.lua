require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'markdown', 'markdown_inline' },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
  },
}
