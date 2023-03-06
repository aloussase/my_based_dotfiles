local BaseKeybindings = {}

function BaseKeybindings:init(o)
  o = o or {}
  o.bufferOptions = o.bufferOptions or { noremap = true, silent = true }
  setmetatable(o, self)
  self.__index = self
  return o
end

function BaseKeybindings:createKeybindings()
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, self.bufferOptions)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, self.bufferOptions)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, self.bufferOptions)
  vim.keymap.set(
    'n',
    '<leader>f',
    function() vim.lsp.buf.format { async = true } end,
    self.bufferOptions
  )
end

local BuiltinLspKeybindings = BaseKeybindings:init()
local LspSagaKeybindings = BaseKeybindings:init()

function BuiltinLspKeybindings:createKeybindings()
  BaseKeybindings.createKeybindings(self)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, self.bufferOptions)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, self.bufferOptions)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, self.bufferOptions)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, self.bufferOptions)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, self.bufferOptions)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, self.bufferOptions)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, self.bufferOptions)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, self.bufferOptions)
end

function LspSagaKeybindings:createKeybindings()
  BaseKeybindings.createKeybindings(self)
  vim.keymap.set("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", self.bufferOptions)
  vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', self.bufferOptions)
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', self.bufferOptions)
  vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', self.bufferOptions)
  vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_type_definition<CR>', self.bufferOptions)
  vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', self.bufferOptions)
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", self.bufferOptions)
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", self.bufferOptions)
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", self.bufferOptions)
end

local KeybindingFactory = {}
function KeybindingFactory:getKeybindings(bufferOptions)
  assert(type(bufferOptions) == 'table', 'Expected bufferOptions to be a table')

  local has_lspsaga, lspsaga = pcall(require, 'lspsaga')
  if has_lspsaga then
    lspsaga.setup{}
    return LspSagaKeybindings:init(bufferOptions)
  else
    return BuiltinLspKeybindings:init(bufferOptions)
  end
end

return {
  KeybindingFactory = KeybindingFactory
}
