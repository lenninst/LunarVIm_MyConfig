--NOTE: MY KEYMAPS -----------------------------------------------------------------
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
-- Agregar keymap para seleccionar todo el documento con Ctrl+a
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
-- Define una variable global para rastrear el estado de relativenumber
vim.opt.relativenumber = true
lvim.relativenumber_enabled = true

-- Agrega un mapeo de teclas para alternar relativenumber al presionar Alt + n
lvim.keys.normal_mode["<A-n>"] = function()
  if lvim.relativenumber_enabled then
    vim.cmd("set norelativenumber")
    lvim.relativenumber_enabled = false
  else
    vim.cmd("set relativenumber")
    lvim.relativenumber_enabled = true
  end
end

--NOTE: CUSTOM PLUGINS CONFIG-----------------------------------------------
-- visual folding config
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  require('lspconfig')[ls].setup({
    capabilities = capabilities
    -- you can add other fields for setting up lsp server in this table
  })
end
require('ufo').setup()

require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})


require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return ''
  end
})

-- obsidian config 
vim.o.conceallevel = 1  -- o 2 si prefieres
