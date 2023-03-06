local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    preview = false,
    theme = "dropdown",
  },
  pickers = {},
  extensions = {}
}

-- Extensions
--
telescope.load_extension('hoogle')

-- Mappings
--
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', '<Cmd>Telescope hoogle theme=dropdown<CR>')
