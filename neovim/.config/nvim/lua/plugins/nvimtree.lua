vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  view = {
    side = 'right',
    hide_root_folder = true,
    width = 25,
    cursorline = false,
    -- signcolumn = false,
  },
  renderer = {
    add_trailing = true,
    group_empty = true
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true
  }
}

vim.keymap.set('n', '<leader>b', function()
  require("nvim-tree.api").tree.toggle(false, true)
end, { silent = true, noremap = true })
