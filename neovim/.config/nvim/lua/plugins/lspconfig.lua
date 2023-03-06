local function setup_fidget()
  local has_fidget, fidget = pcall(require, "fidget")
  if has_fidget then
    fidget.setup{}
  end
end

local function setup_lsp_signature()
  local has_lsp_signature, lsp_signature = pcall(require, "lsp_signature")
  if has_lsp_signature then
    lsp_signature.setup{
      hint_prefix = '',
      bind = true,
      handle_opts = {
        border = 'rounded'
      }
    }

    local opts = { silent = true, noremap = true }
    vim.keymap.set('n', '<C-k>', function() lsp_signature.toggle_float_win() end, opts)
  end
end

local function setup_lsp_kind()
  local has_lsp_kind, lsp_kind = pcall(require, 'lspkind')
  if has_lsp_kind then
    lsp_kind.init{}
  end
end

local function setup_nvim_lightbulb() 
  local has_lightbulb, lightbulb = pcall(require, 'nvim-lightbulb')
  if has_lightbulb then
    lightbulb.setup {
      autocmd = {
        enabled = true
      }
    }
  end
end

local on_attach = function(client, bufnr)
  -- Setup completion
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Setup keybindings
  local keybindings = require('plugins.lspconfig.keybindings')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keybindings.KeybindingFactory:getKeybindings(bufopts):createKeybindings()

  -- Setup extensions
  setup_fidget()
  setup_lsp_signature()
  setup_lsp_kind()
  setup_nvim_lightbulb()
end

local lspconfig = require('lspconfig')

lspconfig.hls.setup {
  on_attach = on_attach,
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  settings = {
    haskell = {
      hlintOn = true,
      formattingProvider = 'stylish-haskell'
    }
  }
}
