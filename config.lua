reload("lnn.options")

-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}


--NOTE: CUSTOM PLUGINS -----------------------------------------------------------------
lvim.plugins = {
  --auto-save
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async"
  },

  { "nvim-treesitter/nvim-treesitter-angular" },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  --tailwind pick color
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}
  },
  {
    'VidocqH/lsp-lens.nvim'
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  --git
  {
    "sindrets/diffview.nvim"
  },
  {
    "lewis6991/gitsigns.nvim"
  },
  -- neorg
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Queremos que este plugin cargue primero
    config = true,   -- Esto ejecuta automáticamente `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "vhyrro/luarocks.nvim" },
    version = "*",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Carga comportamiento predeterminado
          ["core.concealer"] = {}, -- Añade íconos bonitos a tus documentos
          ["core.dirman"] = {      -- Gestiona espacios de trabajo de Neorg
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  --markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   config = true, -- or `opts = {}`
  -- },
  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recomendado, usar la última versión en vez del último commit
    lazy = true,
    ft = "markdown",
    -- Cargar obsidian.nvim solo para archivos markdown en tu vault
    event = {
      -- Usar la ruta completa de tu vault
      "BufReadPre D:/SyncFolders/obsidian_Sync/apuntes/**.md",
      "BufNewFile D:/SyncFolders/obsidian_Sync/apuntes/**.md",
    },
    dependencies = {
      -- Requerido
      "nvim-lua/plenary.nvim",

      -- Ver la lista completa de dependencias opcionales abajo 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "D:/SyncFolders/obsidian_Sync/apuntes/personal",
        },
        {
          name = "work",
          path = "D:/SyncFolders/obsidian_Sync/apuntes/work",
        },
      },
      ui = {
        enable = false, -- Desactiva las características adicionales de la UI
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors"
  },
  -- refactor
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  -- nextjs
  {
    "dreamsofcode-io/nvim-nextjs",
  },
  { "windwp/nvim-ts-autotag" },
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },

}

--PERF: plugin requeridos
require 'lsp-lens'.setup({})

require("lvim.lsp.manager").setup("angularls")
-- PERF: java formater
formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "google-java-format",
    filetypes = { "java" },
  }
}
--PERF: css color
-- Ensure termguicolors is enabled if not already
vim.opt.termguicolors = true
require('nvim-highlight-colors').setup({})
-- options
require("nvim-highlight-colors").setup {
  ---Render style
  ---@usage 'background'|'foreground'|'virtual'
  render = 'foreground',

  ---Set virtual symbol (requires render to be set to 'virtual')
  virtual_symbol = '■',

  ---Set virtual symbol suffix (defaults to '')
  virtual_symbol_prefix = '',

  ---Set virtual symbol suffix (defaults to ' ')
  virtual_symbol_suffix = ' ',

  ---Set virtual symbol position()
  ---@usage 'inline'|'eol'|'eow'
  ---inline mimics VS Code style
  ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
  ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
  virtual_symbol_position = 'inline',

  ---Highlight hex colors, e.g. '#FFFFFF'
  enable_hex = true,

  ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
  enable_rgb = true,

  ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
  enable_hsl = true,

  ---Highlight CSS variables, e.g. 'var(--testing-color)'
  enable_var_usage = true,

  ---Highlight named colors, e.g. 'green'
  enable_named_colors = true,

  ---Highlight tailwind colors, e.g. 'bg-blue-500'
  enable_tailwind = false,

  ---Set custom colors
  ---Label must be properly escaped with '%' to adhere to `string.gmatch`
  --- :help string.gmatch
  custom_colors = {
    { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
    { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
  }
}

--PERF: copilot config
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

