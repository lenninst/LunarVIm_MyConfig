-- print("hola desde pomo");


lvim.plugins = {
  {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },  -- Comandos que activan el plugin
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {
    },
    config = function()
    end
  },
}


