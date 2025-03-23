
local colors = {
  agua_de_rosas = "#f4dbd6",
  flamenco = "#f0c6c6",
  rosa = "#f5bde6",
  malva = "#c6a0f6",
  rojo = "#ed8796",
  granate = "#ee99a0",
  melocoton = "#f5a97f",
  amarillo = "#eed49f",
  verde = "#a6da95",
  cerceta = "#8bd5ca",
  cielo = "#91d7e3",
  zafiro = "#7dc4e4",
  azul = "#8aadf4",
  lavanda = "#b7bdf8",
  texto = "#cad3f5",
  subtexto_1 = "#b8c0e0",
  subtexto_0 = "#a5adcb",
  superposicion_2 = "#939ab7",
  superposicion_1 = "#8087a2",
  superposicion_0 = "#6e738d",
  superficie_2 = "#5b6078",
  superficie_1 = "#494d64",
  superficie_0 = "#363a4f",
  base = "#24273a",
  manto = "#1e2030",
  corteza = "#181926",
  transparente = "NONE",
}

local custom_theme = {
  normal = {
    c = { fg = colors.superposicion_0, bg = colors.corteza },
    a = { fg = colors.base, bg = colors.zafiro, gui = "bold" },
    b = { fg = colors.subtexto_0, bg = colors.transparente },
  },
  insert = {
    a = { fg = colors.base, bg = colors.zafiro, gui = "bold" },
    b = { fg = colors.subtexto_0, bg = colors.superficie_1 },
  },
  visual = {
    a = { fg = colors.base, bg = colors.rosa, gui = "bold" },
    b = { fg = colors.subtexto_0, bg = colors.superficie_1 },
  },
  replace = {
    a = { fg = colors.base, bg = colors.rojo, gui = "bold" },
    b = { fg = colors.subtexto_0, bg = colors.superficie_1 },
  },
  inactive = {
    c = { fg = colors.subtexto_0, bg = colors.base },
    a = { fg = colors.subtexto_0, bg = colors.superficie_1, gui = "bold" },
    b = { fg = colors.subtexto_0, bg = colors.superficie_1 },
  },
}

-- lvim.builtin.lualine.options.theme = custom_theme



