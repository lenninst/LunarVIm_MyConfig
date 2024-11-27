reload("lnn.options")

vim.opt.termguicolors = true
-- lvim.colorscheme = "catppuccin"

-- lvim.builtin.indentlines.active = false


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
    cmd = "ASToggle",              -- opcional para carga perezosa en el comando
    event = { "InsertLeave" },     -- opcional para carga perezosa en eventos de activación
    opts = {
      immediate_save = false,      -- desactiva el guardado inmediato cuando el buffer pierde el enfoque
      defer_save = true,           -- activa el guardado diferido
      cancel_deferred_save = true, -- cancela el guardado diferido si vuelves a entrar en modo de inserción
      write_all_buffers = false,   -- solo guarda el buffer actual, no todos los buffers
      noautocmd = false,           -- ejecuta autocommands al guardar
      lockmarks = false,           -- no bloquear marcas al guardar
      debounce_delay = 15000,      -- retraso de 5 segundos para el guardado diferido
      debug = false,               -- desactiva los mensajes de depuración
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
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  { 'akinsho/git-conflict.nvim',              version = "*", config = true },
  -- neorg
  {
    "vhyrro/luarocks.nvim",
    priority = 999, -- Queremos que este plugin cargue primero
    config = true,  -- Esto ejecuta automáticamente `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "vhyrro/luarocks.nvim" },
    -- version = "*",
    version = "v7.0.0",
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
  --auto tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,          -- Cierre automático de etiquetas
          enable_rename = true,         -- Renombrar pares de etiquetas automáticamente
          enable_close_on_slash = false -- Cerrar automáticamente al escribir </
        },
        per_filetype = {
          ["html"] = {
            enable_close = false
          }
        }
      })
    end
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  --rename files
  {
    'tpope/vim-eunuch',
    config = function()
      vim.cmd('cnoreabbrev rename Rename')
    end
  },
  --rename words
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  -- themes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- puedes cambiarlo a "latte", "frappe", etc.
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine"
  },
  {
    'shaunsingh/nord.nvim',
    name = "nord"
  },
  {
    "kyazdani42/blue-moon",
    name = "blue-moon"
  },
  {
    "olimorris/onedarkpro.nvim",
    -- priority = 1000, -- Ensure it loads first
  {
    'embark-theme/vim',
    name = 'embark'
  },
  {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
      }
    end,
  },
  -- react
  -- Plugin para React con configuración
  {
    "mlaursen/vim-react-snippets",
    config = function()
      require("vim-react-snippets").lazy_load()
    end,
  },
  -- conform code cleaner
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  --error traslator
  { 'dmmulroy/ts-error-translator.nvim' },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup({
        -- …
      })
    end,
  },

  -- go definition
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,              -- Width of the floating window
        height = 25,              -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false,            -- Print debug information
        opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
      }
    end
  },
  -- codium ia autocompletion
  -- add this to the file where you setup your other plugins:
  {
    "monkoose/neocodeium",
    -- event = "VeryLazy",
    keys = { "<A-6>" },
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
    end,
  },
  -- move motions hop
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    event = "BufRead",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  -- numb line
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  -- auto documentation
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    version = "*"
  },
  -- rainbow parentheses
  {
    "p00f/nvim-ts-rainbow",
    branch = "master",
    config = function()
      require('nvim-treesitter.configs').setup {
        rainbow = {
          enable = true,
          extended_mode = true, -- También resaltar otros tipos de delimitadores como html tags
          max_file_lines = nil, -- No limit
          colors = {
            "#f2d5cf",
            "#179299",
            "#8aadf4",
            "#ca9ee6",
            "#91d7e3",
            "#eebebe",
            "#ca9ee6",
          }
        }
      }
    end
  },
  -- ventana quicfix
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  -- mini  plugin complements
  {
    'echasnovski/mini.nvim',
    version = '*'
  },

  -- sql manager
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      {
        'tpope/vim-dadbod',
        lazy = true
      },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  -- sqlite
  { "kkharji/sqlite.lua" },
  -- material incons
  {
    "nvim-tree/nvim-web-devicons",
    event = { "VeryLazy" },
    dependencies = {
      "Allianaab2m/nvim-material-icon-v3",
    },
    config = function()
      require("nvim-web-devicons").setup({
        override = require("nvim-material-icon").get_icons()
      })
    end
  },
  -- headtailwind sort tailwind classes
  {
    "steelsojka/headwind.nvim"
  },
  -- scroll
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup({})
    end
  },
  -- diagnostics viewer
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- multi cursort
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {},     -- This causes the plugin setup function to be called
    keys = {
      { "<C-j>",         "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "x" },      desc = "Add cursor and move down" },
      { "<C-k>",         "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "x" },      desc = "Add cursor and move up" },

      { "<C-Up>",        "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
      { "<C-Down>",      "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

      { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",   mode = { "n", "i" },      desc = "Add or remove cursor" },

      { "<Leader>a",     "<Cmd>MultipleCursorsAddMatches<CR>",       mode = { "n", "x" },      desc = "Add cursors to cword" },
      { "<Leader>A",     "<Cmd>MultipleCursorsAddMatchesV<CR>",      mode = { "n", "x" },      desc = "Add cursors to cword in previous area" },

      { "<Leader>d",     "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" },      desc = "Add cursor and jump to next cword" },
      { "<Leader>D",     "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" },      desc = "Jump to next cword" },

      { "<Leader>l",     "<Cmd>MultipleCursorsLock<CR>",             mode = { "n", "x" },      desc = "Lock virtual cursors" },
    },
  },
  -- focus ligth
  {
    "folke/twilight.nvim",
    opts = {
    }
  },
  -- create folder advance
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- Configuración para usar SumatraPDF
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_general_viewer = "C:\\Users\\Kanguro\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe"
      vim.g.vimtex_view_general_options = "-reuse-instance"

      -- Configurar compilador para latexmk
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build", -- Cambia si usas un directorio diferente
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end
  },
 }
}


--PERF: plugin requeridos
require 'lsp-lens'.setup({})

--NOTE: angular confi
require("lvim.lsp.manager").setup("angularls")

-- NOTE: java formater
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
  render = 'virtual',

  ---Set virtual symbol (requires render to be set to 'virtual')
  virtual_symbol = '●',

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

--NOTE: traductor de error config
require("ts-error-translator").setup()

lvim.lsp.on_attach_callback = function(client, bufnr)
  -- …
  require "lsp_signature".on_attach()
  -- …
end

-- rainbow config
-- lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.enable = true

--NOTE: color por defecto
-- Configuración para cargar el tema por defecto
vim.cmd("colorscheme catppuccin")

-- folder icons personalizados
require('nvim-material-icon').setup {
  override = {
    src = {
      icon = "󰴉", -- Icono para carpetas src
      color = "#a6d189",
      cterm_color = "185",
      name = "Src"
    },
    interfaces = {
      icon = "", -- Icono para carpetas interfaces
      color = "#007acc",
      cterm_color = "32",
      name = "Interfaces"
    },
    -- Agrega más configuraciones según sea necesario
  },
  color_icons = true, -- Habilita colores personalizados
  default = true,     -- Habilita íconos predeterminados si no se encuentra uno personalizado
}
