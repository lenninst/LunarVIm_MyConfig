local M = {}

--NOTE: keymaps globals -----------------------------------------------------------------
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
-- seleccionar todo el documento con Ctrl+a
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- keymap para cambiar relativenumber
vim.opt.relativenumber = true
lvim.relativenumber_enabled = true

lvim.keys.normal_mode["<A-n>"] = function()
  if lvim.relativenumber_enabled then
    vim.cmd("set norelativenumber")
    lvim.relativenumber_enabled = false
  else
    vim.cmd("set relativenumber")
    lvim.relativenumber_enabled = true
  end
end

--NOTE: keymaps de plugins -------------------------------------
-- Vimlatex
-- Sincronización inversa con SumatraPDF (en la tecla F8)
vim.api.nvim_set_keymap('n', '<F8>', ':VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', ':VimtexTocToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F6>', ':VimtexCompile<CR>', { noremap = true, silent = true })

-- Codeium
-- Aceptar sugerencia completa
vim.keymap.set("i", "<A-f>", function()
    require("neocodeium").accept()
end)

-- Aceptar una palabra
vim.keymap.set("i", "<A-w>", function()
    require("neocodeium").accept_word()
end)

-- Aceptar una línea completa
vim.keymap.set("i", "<A-a>", function()
    require("neocodeium").accept_line()
end)

-- Ciclar o completar hacia adelante
vim.keymap.set("i", "<A-e>", function()
    require("neocodeium").cycle_or_complete()
end)

-- Ciclar o completar hacia atrás
vim.keymap.set("i", "<A-r>", function()
    require("neocodeium").cycle_or_complete(-1)
end)

-- Limpiar sugerencia
vim.keymap.set("i", "<A-c>", function()
    require("neocodeium").clear()
end)

return M
