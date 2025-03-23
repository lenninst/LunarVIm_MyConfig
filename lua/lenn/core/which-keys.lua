-- hop
lvim.builtin.which_key.mappings["k"] = {
  name = " 󱕘 Hop",
  w = { "<cmd>HopWord<CR>", "Word" },
  z = { "<cmd>HopChar1<CR>", "Char" },
  v = { "<cmd>HopVertical<CR>", "Vertical" },
  a = { "<cmd>HopAnywhere<CR>", "Anywhere" },
  s = { "<cmd>HopPattern<CR>", "Pattern" },
  l = { "<cmd>HopWordCurrentLine<CR>", "Word Current Line" },
  j = { "<cmd>HopAnywhereCurrentLine<CR>", "Anywhere Current Line" },
  i = { "<cmd>HopLineStart<CR>", "Line Start" },
}

-- latex
lvim.builtin.which_key.mappings["v"] = {
  name = "  VimTeX",
  v = { "<cmd>VimtexView<CR>", "Ver PDF" },
  s = { "<cmd>VimtexStop<CR>", "Detener compilación" },
  o = { "<cmd>VimtexOutline<CR>", "Ver índice" },
  c = { "<cmd>VimtexCompile<CR>", "Compilar" },
}

--ufo folding
lvim.builtin.which_key.mappings["z"] = {
  name = "  Plegado",
  R = { "<cmd>lua require('ufo').openAllFolds()<CR>", "Abrir todos los pliegues" },
  M = { "<cmd>lua require('ufo').closeAllFolds()<CR>", "Cerrar todos los pliegues" },
  a = { "<cmd>lua vim.cmd.normal('za')<CR>", "Plegar función/bloque actual" },
}

-- trouble . diagnostics
lvim.builtin.which_key.mappings["t"] = {
  name = "  Trouble",
  d = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
  b = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
  l = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)" },
  q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
}

-- copilot
lvim.builtin.which_key.mappings["C"] = {
  name = "  Copilot",
  a = { "<cmd>Copilot enable<CR>", "Activar Copilot" },
  d = { "<cmd>Copilot disable<CR>", "Desactivar Copilot" },
  t = { "<cmd>Copilot toggle<CR>", "Alternar Copilot" },
  p = { "<cmd>Copilot panel<CR>", "Abrir Panel de Copilot" },
  s = { "<cmd>Copilot status<CR>", "Ver estado de Copilot" },
  w = { "<cmd>Copilot workspace add<CR>", "Añadir carpeta al Workspace" },
  x = { "<cmd>Copilot workspace remove<CR>", "Eliminar carpeta del Workspace" },
  r = { "<cmd>Copilot refresh<CR>", "Refrescar sugerencias" },
}

-- copilotchat
lvim.builtin.which_key.mappings["a"] = {
  name = "  Copilot Chat",
  o = { "<cmd>CopilotChatOpen<CR>", "Abrir chat" },
  q = { "<cmd>CopilotChatClose<CR>", "Cerrar chat" },
  t = { "<cmd>CopilotChatToggle<CR>", "Alternar chat" },
  s = { "<cmd>CopilotChatStop<CR>", "Detener salida" },
  r = { "<cmd>CopilotChatReset<CR>", "Reiniciar chat" },
  p = { "<cmd>CopilotChatPrompts<CR>", "Ver plantillas de prompts" },
  m = { "<cmd>CopilotChatModels<CR>", "Ver modelos disponibles" },
  a = { "<cmd>CopilotChatAgents<CR>", "Ver agentes disponibles" },
  e = { "<cmd>CopilotChatExplain<CR>", "Explicar código seleccionado" },
  v = { "<cmd>CopilotChatReview<CR>", "Revisar código seleccionado" },
  f = { "<cmd>CopilotChatFix<CR>", "Corregir código" },
  d = { "<cmd>CopilotChatDocs<CR>", "Agregar documentación" },
  x = { "<cmd>CopilotChatOptimize<CR>", "Optimizar código" },
  T = { "<cmd>CopilotChatTests<CR>", "Generar pruebas" },
  g = { "<cmd>CopilotChatCommit<CR>", "Generar mensaje de commit" },
  c = {
    function()
      local msg = vim.fn.input("CopilotChat: ")
      if msg ~= "" then
        vim.cmd("CopilotChat " .. msg)
      end
    end,
    "Enviar mensaje"
  },
}

--auto save
lvim.builtin.which_key.mappings["A"] = {
  name = "  Auto-save", -- Nombre del grupo
  t = { "<cmd>ASToggle<CR>", "Toggle Auto-Save" }, -- Comando para alternar
}
