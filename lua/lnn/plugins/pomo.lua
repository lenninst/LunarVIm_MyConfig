local pomo = {
  "epwalsh/pomo.nvim",
  version = "*",
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    "rcarriga/nvim-notify",
  },
  opts = {
    -- Opciones específicas de pomo aquí
  },
  config = function()
    -- Configuración adicional si es necesaria
  end
}

return pomo