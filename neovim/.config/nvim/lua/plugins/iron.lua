local iron = require('iron.core')
local view = require('iron.view')

iron.setup {
  config = {
    repl_open_cmd = view.split.vertical.botright(50),
    repl_definition = {
      haskell = {
        command = function(meta)
          local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
          return { 'cabal', 'v2-repl', filename}
        end
      }
    },
  },
  keymaps = {
    visual_send = "<leader>sv",
    send_file = "<leader>sf",
    send_line = "<leader>sl",
    clear = "<leader>cl",
    exit = "<leader>ex",
  },
}

vim.keymap.set('n', '<leader>is', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<leader>ir', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>if', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>ih', '<cmd>IronHide<cr>')
